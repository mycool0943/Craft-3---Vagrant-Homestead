<?php
/**
 * Focuspoint plugin for Craft CMS 3.x
 *
 * Focuspoint lets you select a focal point of an image asset.
 *
 * @link      http://roundhouseagency.com/
 * @copyright Copyright (c) 2017 Vadim Goncharov
 */

namespace roundhousefocuspoint\focuspoint\services;

use roundhousefocuspoint\focuspoint\Focuspoint;

use Craft;
use craft\base\Component;

/**
 * FocuspointService Service
 *
 * All of your plugin’s business logic should go in services, including saving data,
 * retrieving data, etc. They provide APIs that your controllers, template variables,
 * and other plugins can interact with.
 *
 * https://craftcms.com/docs/plugins/services
 *
 * @author    Vadim Goncharov
 * @package   Focuspoint
 * @since     1.0.0
 */
class FocuspointService extends Component
{
    // Public Methods
    // =========================================================================

    /**
     * This function can literally be anything you want, and you can have as many service
     * functions as you want
     *
     * From any other plugin file, call it like this:
     *
     *     Focuspoint::$plugin->focuspointService->exampleService()
     *
     * @return mixed
     */
    public function exampleService()
    {
        $result = 'something';

        return $result;
    }
}
