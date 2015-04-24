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
    function slugify ($input) {
        return $input;
    }
    
    $exposants_base_folder = "../texts/exposants";
    $exposants_file = '../texts/exposants.md';
    $exposants_source = file_get_contents($exposants_file);
    // Shoulf match all exhibitors
    $exposants_regex = "/\[(.[^\<]+)(\s\<.*)\]\((.*)\)/i";
    // Template for an exhibitor detail file
    $exposant_template = '#(%1$s)[%2$s]';

    $matches = [];
    preg_match_all($exposants_regex, $exposants_source, $matches, PREG_SET_ORDER);
    
    $e = 0;
    $output = '';
    
    foreach($matches as $match) {
        $system_name = slugify($match[1]);
        $label = $match[1] . $match[2];
        $url = $match[3];
        $output .= sprintf('* (%1$s)[%2$s]', $label, $system_name);
        $output .= "\n";
        $exposant_folder = sprintf('%1$s/%2$s', $exposants_base_folder, $e, $system_name);
        
        ensure_dir($exposant_folder);
        file_put_contents(sprintf('%1$s/en.md', $exposant_folder), sprintf($exposant_template, $label, $url));
        file_put_contents(sprintf('%1$s/fr.md', $exposant_folder), sprintf($exposant_template, $label, $url));
        
        $e++;
    }

    file_put_contents(sprintf('%1$s.bak', $exposants_file), $output);
    
?>