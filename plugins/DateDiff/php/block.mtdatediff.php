<?php

function smarty_block_mtdatediff ($args, $content, &$ctx) {
    $var_name = $args['name'];
    $interval = $args['interval'];

    if ($var_name) {
        $date_str = $ctx->__stash['vars'][ $var_name ];
        $target_ts = strtotime(preg_replace("/(\d{4})(\d{2})(\d{2})/", "$1-$2-$3", $date_str));
        $base_ts = strtotime(date('Y-m-d'));
        $duration = $base_ts - $target_ts;

        if ($interval > 0) {
            $duration = $duration * -1;

            if ($duration > 0 && $duration < 86400 * $interval) {
                $flag = 1;
            } else {
                $flag = 0;
            }
        } else {
            if ($duration > 0 && $duration < 86400 * $interval * -1) {
                $flag = 1;
            } else {
                $flag = 0;
            }
        }

        return $ctx->_hdlr_if($args, $content, $ctx, $repeat, $flag);
    }

    return $ctx->_hdlr_if($args, $content, $ctx, $repeat);
}
