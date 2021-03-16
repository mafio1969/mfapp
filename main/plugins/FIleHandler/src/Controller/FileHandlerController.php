<?php

namespace FIleHandler\Controller;

use App\Controller\Component\ImageresizeComponent;
use Cake\Event\Event;
use Croogo\Users\Controller\Component\UserComponent;

/**
 * Class FileHandlerController
 *
 * @package FIleHandler\Controller
 * @property UserComponent User
 * @property ImageresizeComponent Imageresize
 */
class FileHandlerController extends AppController
{
    const MAX_FILE_WIDTH = 1600;

    const MAX_FILE_HEIGHT = 1600;

    /**
     * Components
     *
     * @var array
     */
    public $components = ['User', 'Imageresize'];

    public function beforeFilter(Event $event)
    {
        $this->Security->setConfig('unlockedActions', ['upload']);
        if (in_array($this->request->action, ['upload'])) {
            $this->getEventManager()->off($this->Csrf);
        }
    }

    public function upload()
    {
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            $imageFileName = $this->User->upload($data['upload']);
            $relativeImagePath = '/' . UserComponent::IMAGE_PREFIX . DS . $imageFileName;
            $absoluteImagePath = WWW_ROOT . UserComponent::IMAGE_PREFIX . DS . $imageFileName;

            $this->Imageresize->load($absoluteImagePath);

            if ($this->Imageresize->getWidth() > self::MAX_FILE_WIDTH) {
                $this->Imageresize->resizeToWidth(self::MAX_FILE_WIDTH);
            }

            if ($this->Imageresize->getHeight() > self::MAX_FILE_HEIGHT) {
                $this->Imageresize->resizeToHeight(self::MAX_FILE_HEIGHT);
            }

            $this->Imageresize->save($absoluteImagePath);

            if ($imageFileName) {
                $response = [
                    'uploaded' => 1,
                    'fileName' => $imageFileName,
                    'url' => $relativeImagePath,
                ];
            } else {
                $response = [
                    'uploaded' => 0,
                    'error' => [
                        'message' => __('Error while uploading file')
                    ]
                ];
            }
            $this->set('response', $response);
            $this->set('_serialize', 'response');
        }
    }
}
