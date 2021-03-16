<?php

/**
 * SocialConnect project
 * @author: Patsura Dmitry https://github.com/ovr <talk@dmtry.me>
 * @author Alexander Fedyashov <a@fedyashov.com>
 */

namespace SocialConnect\OAuth2\Provider;

use SocialConnect\Provider\AccessTokenInterface;
use SocialConnect\Provider\Exception\InvalidAccessToken;
use SocialConnect\Provider\Exception\InvalidResponse;
use SocialConnect\OAuth2\AbstractProvider;
use SocialConnect\OAuth2\AccessToken;
use SocialConnect\Common\Entity\User;
use SocialConnect\Common\Hydrator\ObjectMap;

/**
 * Class Provider
 * @package SocialConnect\Google
 */
class Google extends AbstractProvider
{
    /**
     * {@inheritdoc}
     */
    public function getBaseUri()
    {
        return 'https://www.googleapis.com/';
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthorizeUri()
    {
        return 'https://accounts.google.com/o/oauth2/auth';
    }

    /**
     * {@inheritdoc}
     */
    public function getRequestTokenUri()
    {
        return 'https://accounts.google.com/o/oauth2/token';
    }

    /**
     * {@inheritdoc}
     */
    public function getName()
    {
        return 'google';
    }

    /**
     * {@inheritdoc}
     */
    public function parseToken($body)
    {
        $result = json_decode($body, true);
        if ($result) {
            return new AccessToken($result);
        }

        throw new InvalidAccessToken('Provider response with not valid JSON');
    }

    /**
     * {@inheritdoc}
     */
    public function getIdentity(AccessTokenInterface $accessToken)
    {
//        $response = $this->httpClient->request(
//            $this->getBaseUri() . 'oauth2/v1/userinfo',
//            [
//                'access_token' => $accessToken->getToken()
//            ]
//        );
        $query = http_build_query([
            'access_token' => $accessToken->getToken()
        ]);
        $cURLConnection = curl_init();

        curl_setopt($cURLConnection, CURLOPT_URL, $this->getBaseUri() . 'oauth2/v1/userinfo'  . '?' . $query);
        curl_setopt($cURLConnection, CURLOPT_RETURNTRANSFER, true);

        $result = curl_exec($cURLConnection);
        curl_close($cURLConnection);

//        if (!$response->isSuccess()) {
//            throw new InvalidResponse(
//                'API response with error code',
//                $response
//            );
//        }
//
//        $result = $response->json();
        if (!$result) {
            throw new InvalidResponse(
                'API response is not a valid JSON object',
                $response
            );
        }
        $result = json_decode($result);
        $hydrator = new ObjectMap(
            [
                'id' => 'id',
                'given_name' => 'firstname',
                'family_name' => 'lastname',
                'email' => 'email',
                'verified_email' => 'emailVerified',
                'name' => 'fullname',
                'gender' => 'sex',
                'picture' => 'pictureURL'
            ]
        );

        return $hydrator->hydrate(new User(), $result);
    }

    /**
     * {@inheritdoc}
     */
    public function getScopeInline()
    {
        return implode(' ', $this->scope);
    }
}