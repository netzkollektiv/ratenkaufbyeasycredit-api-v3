<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\DowngradeLevelSetList;
use Rector\Core\ValueObject\PhpVersion;

return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        __DIR__ . '/dist/php/src'
    ]);
    $rectorConfig->phpVersion(PhpVersion::PHP_56);
    //$rectorConfig->import(DowngradeLevelSetList::DOWN_TO_PHP_56);
    $rectorConfig->import(DowngradeLevelSetList::DOWN_TO_PHP_70);
    $rectorConfig->import(DowngradeLevelSetList::DOWN_TO_PHP_71);
};
