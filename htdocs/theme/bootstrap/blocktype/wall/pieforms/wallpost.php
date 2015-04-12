<?php

// Note: this template isn't echoing the description or error keys for each
// element, but there's no validation or descriptions on this form currently

echo $form_tag;
echo '<div id="wall" class="panel-body"><div class="description metadata mbl">' . $elements['postsizelimit']['html'] . ' ' . $elements['text']['description'] . '</div>';
echo '<div>' . $elements['text']['labelhtml'] . $elements['text']['html'] .'</div>';
if (isset($elements['text']['error'])) {
    echo '<div class="errmsg">' . $elements['text']['error'] . '</div>';
}
echo '<div class="makeprivate checkbox form-group mbl">' . $elements['private']['labelhtml'] . ' ' . $elements['private']['html'] . '</div>';
echo '<div>' . $elements['submit']['html'] . '</div></div>';
echo $hidden_elements;
echo '</form>';
