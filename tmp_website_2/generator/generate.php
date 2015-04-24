<?php

    require_once 'PHPMarkdownLib/Michelf/Markdown.inc.php';

    $markdown_dir = "../texts";
    $index_template = "template/index.tpl";
    $index_export_file = "../index.html";
    $site_location = "http://www.multipleartdays.com";
    $exhibitors_input_folder = "../texts/exposants";
    $exhibitors_output_folder = "../exposants";
    
    function parseHTML($input, $markdown_dir) {
        $linkPattern = "/\{\%\s+(.*)\s+\%\}/";
        return preg_replace_callback($linkPattern, function ($matches) use ($markdown_dir) {
            $path = sprintf("%s/%s.md", $markdown_dir, $matches[1]);

            if (file_exists($path)) {
                return parseMarkdown(file_get_contents($path), $markdown_dir);
            } else {
                return sprintf("Could not find %s", $path);
            }
        }, $input);
    }
    
    function parseMarkdown($input, $markdown_dir) {
        return parseHTML(Michelf\Markdown::defaultTransform($input), $markdown_dir);
    }

    function ensure_dir ($path) {
        if (!is_dir($path)) {
            mkdir($path, 0755, true);
        }
    }

    // Generate index
    $index_input = file_get_contents($index_template);
    $index_output = parseHTML($index_input, $markdown_dir);
    file_put_contents($index_export_file, $index_output);
    
    function parse_exhibitor($source_directory, $output_directory, $markdown_dir) {
        ensure_dir($output_directory);
        
        $handle = opendir($source_directory);
        
        while (false !== ($file = readdir($handle))) {
            $input_filepath = sprintf("%s/%s", $source_directory, $file);
            $output_filepath = sprintf("%s/%s", $output_directory, $file);
            
            if (preg_match('/\.md$/', $file) > 0) {
                $markdown = file_get_contents($input_filepath);
                $html = parseMarkdown($markdown, $markdown_dir);
                file_put_contents(str_replace('.md', '.html', $output_filepath), $html);
            } elseif (preg_match('/\.(png|jpg|jpeg|gif)$/i', $file) > 0) {
                if (!file_exists($output_filepath) or filemtime($input_filepath) > filemtime($output_filepath)) {
                    copy($input_filepath, $output_filepath);
                }
            } 
        }
        
        foreach(glob(sprintf("%s/*.md", $source_directory)) as $md_file) {
            $markdown = file_get_contents($md_file);
            $html = parseMarkdown($markdown, $markdown_dir);
            $html_file = preg_replace('/\.md$/', '.html', str_replace($source_directory, $output_directory, $md_file));
            file_put_contents($html_file, $html);
        }
        
        foreach(glob(sprintf('%1$s/*.png %1$s/*.jpeg %1$s/*.gif', $source_directory)) as $image) {
            print $image;
        }
    }
    
    // Generate exhibitor files
    foreach(glob(sprintf("%s/*", $exhibitors_input_folder)) as $exhibitor) {
        if (is_dir($exhibitor)) {
            parse_exhibitor($exhibitor, str_replace($exhibitors_input_folder, $exhibitors_output_folder, $exhibitor), $markdown_dir);
        }
    }
    
    //header(sprintf("Location: %s", $site_location));