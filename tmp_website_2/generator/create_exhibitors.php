<?php

    /**
    * If given directory doesn't exist create it
    */
    function ensure_dir ($path) {
        if (!is_dir($path)) {
            mkdir($path, 0755, true);
        }
    }
   
    /**
    * Returns slugified version of input
    */
    function slugify ($text) {
        // replace non letter or digits by -
        $text = preg_replace('~[^\\pL\d]+~u', '-', $text);

        // trim
        $text = trim($text, '-');

        // transliterate
        if (function_exists('iconv'))
        {
            $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
        }

        // lowercase
        $text = strtolower($text);

        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);

        if (empty($text))
        {
            return 'n-a';
        }

        return $text;
    }
    
    $exposants_base_folder = "../texts/exposants";
    $exposants_file = '../texts/exposants.md';
    $exposants_export_file = '../texts/%1$s/exposants.md';
    $link_template = '/exposants/%1$s/%2$s.html';
    $exposants_source = file_get_contents($exposants_file);
    // Shoulf match all exhibitors
    $exposants_regex = "/\[(.[^\<]+)(\s\<.*)\]\((.*)\)/i";
    // Template for an exhibitor detail file
    $exposant_template = '#(%1$s)[%2$s]';

    $matches = [];
    
    preg_match_all($exposants_regex, $exposants_source, $matches, PREG_SET_ORDER);
    
    $output_fr = '####Exposants';
    $output_fr .= "\n";
    $output_en = '####Exhibitors';
    $output_en .= "\n";
    
    foreach($matches as $match) {
        $system_name = slugify($match[1]);
        $label = $match[1] . $match[2];
        $url = $match[3];
        $output_fr .= sprintf('* (%1$s)[%2$s]', $label, sprintf($link_template, $system_name, 'fr'));
        $output_fr .= "\n";
        $output_en .= sprintf('* (%1$s)[%2$s]', $label, sprintf($link_template, $system_name, 'en'));
        $output_en .= "\n";
        $exposant_folder = sprintf('%1$s/%2$s', $exposants_base_folder, $system_name);
        
        ensure_dir($exposant_folder);
        file_put_contents(sprintf('%1$s/fr.md', $exposant_folder), sprintf($exposant_template, $label, $url));
        file_put_contents(sprintf('%1$s/en.md', $exposant_folder), sprintf($exposant_template, $label, $url));
    }

    file_put_contents(sprintf($exposants_export_file, 'fr'), $output_fr);
    file_put_contents(sprintf($exposants_export_file, 'en'), $output_en);
    
?>