<?php

namespace Articles\View\Helper;

use Cake\View\Helper;
use Articles\Controller\ArticlesController;

/**
 * ArticlesHelper helper
 */
class ArticlesHelper extends Helper
{
    public function renderVotes($counter)
    {
        if ($counter == 0) {
            $result = 0;
        } elseif ($counter > 0) {
            $result = '+' . $counter;
        } else {
            $result = $counter;
        }
        return $result;
    }

    public function printTruncated($maxLength, $html, $isUtf8 = true)
    {
        $result = '';
        $printedLength = 0;
        $position = 0;
        $tags = [];

        // For UTF-8, we need to count multibyte sequences as one character.
        $re = $isUtf8
            ? '{</?([a-z]+)[^>]*>|&#?[a-zA-Z0-9]+;|[\x80-\xFF][\x80-\xBF]*}'
            : '{</?([a-z]+)[^>]*>|&#?[a-zA-Z0-9]+;}';

        while ($printedLength < $maxLength && preg_match($re, $html, $match, PREG_OFFSET_CAPTURE, $position)) {
            list($tag, $tagPosition) = $match[0];

            // Print text leading up to the tag.
            $str = substr($html, $position, $tagPosition - $position);
            if ($printedLength + strlen($str) > $maxLength) {
                $result .= substr($str, 0, $maxLength - $printedLength);
                $printedLength = $maxLength;
                break;
            }

            $result .= $str;
            $printedLength += strlen($str);
            if ($printedLength >= $maxLength) {
                return $result;
                break;
            }

            if ($tag[0] == '&' || ord($tag) >= 0x80) {
                // Pass the entity or UTF-8 multibyte sequence through unchanged.
                $result .= $tag;
                $printedLength++;
            } else {
                // Handle the tag.
                $tagName = $match[1][0];
                if ($tag[1] == '/') {
                    // This is a closing tag.

                    $openingTag = array_pop($tags);
                    assert($openingTag == $tagName); // check that tags are properly nested.

                    $result .= $tag;
                } else {
                    if ($tag[strlen($tag) - 2] == '/') {
                        // Self-closing tag.
                        $result .= $tag;
                    } else {
                        // Opening tag.
                        $result .= $tag;
                        $tags[] = $tagName;
                    }
                }
            }

            // Continue after the tag.
            $position = $tagPosition + strlen($tag);
        }

        // Print any remaining text.
        if ($printedLength < $maxLength && $position < strlen($html)) {
            $result .= substr($html, $position, $maxLength - $printedLength);
        }

        // Close any open tags.
        while (!empty($tags)) {
            $result .= sprintf('</%s>', array_pop($tags));
        }
        return $result;
    }

    public function articleStatus(
        int $visibility,
        bool $verificationTime,
        bool $visibilityByRole
    ) {
        if ($verificationTime && !$visibilityByRole){
            return '<span class="status verification">'.__('Verification').'</span>';
        } elseif ((int)$visibility === 1) {
            return '<span class="status accepted">'.__('Accepted').'</span>';
        } else {
            return '<span class="status rejected">'.__('Rejected').'</span>';
        }
    }

    public function voteTime($published): bool {
        $verificationTime = (time() - $published) < ArticlesController::MAX_VERIFICATION_TIME ? true : false;

        if (is_null($published) || $verificationTime) {
            return true;
        } else {
            return false;
        }
    }
}
