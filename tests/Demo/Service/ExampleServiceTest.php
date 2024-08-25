<?php

use PHPUnit\Framework\TestCase;
use Demo\Service\ExampleService;

class ExampleServiceTest extends TestCase
{
    public function testGetMessage()
    {
        $service = new ExampleService();
        $this->assertEquals("Hello, World!", $service->getMessage());
    }
}