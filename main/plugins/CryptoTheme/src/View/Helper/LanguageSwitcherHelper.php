<?php

namespace CryptoTheme\View\Helper;

use Cake\Core\InstanceConfigTrait;
use Cake\Routing\Router;
use Cake\Utility\Hash;
use Cake\View\Helper;

/**
 * LanguageSwitcher helper
 */
class LanguageSwitcherHelper extends Helper
{
    use InstanceConfigTrait;

    protected $_defaultConfig = [
        'availableLanguages' => [
            'en_US' => 'en_US'
        ],
        'displayNames' => [
            'en_US' => 'English'
        ],
        'imageMapping' => [
            'en_US' => 'United-States'
        ],
        'renderToggleButtonDisplayName' => true,
        'element' => 'LanguageSwitcher.language_switcher'
    ];

    public function renderLanguageSwitcher()
    {
        return $this->_View->element($this->getConfig('element'), [
            'availableLanguages' => $this->getConfig('availableLanguages'),
            'displayNames' => $this->getConfig('displayNames'),
            'imageMapping' => $this->getConfig('imageMapping'),
            'renderToggleButtonDisplayName' => $this->getConfig('renderToggleButtonDisplayName')
        ]);
    }

    public function getUrl($language)
    {
        $params = ['lang' => $language];
        $passParams = $this->request->getParam('pass');
        if (!empty($passParams) && is_array($passParams)) {
            foreach ($passParams as $key => $param) {
                $params[$key] = $param;
            }
        }
        $query = Hash::merge($this->request->getQueryParams(), $params);
        return Router::url($query);
    }
}
