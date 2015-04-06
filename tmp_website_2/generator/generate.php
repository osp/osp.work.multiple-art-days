<?php

    require_once 'PHPMarkdownLib/Michelf/Markdown.inc.php';

    $pattern = "/\{\%\s+(.*)\s+\%\}/";
    $markdown_dir = "../texts";
    $template = "template/index.tpl";
    $export_file = "../index.html";

    $source = file_get_contents($template);
    $output = preg_replace_callback(
        $pattern, 
        function ($matches) use ($markdown_dir) {
            $path = sprintf("%s/%s.md", $markdown_dir, $matches[1]);

            if (file_exists($path)) {
                $md = file_get_contents($path);
                return Michelf\Markdown::defaultTransform($md);
            } else {
                return sprintf("Could not find %s", $path);
            }
        },
        $source);

    file_put_contents($export_file, $output);