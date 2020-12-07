#!/bin/bash

markmap tree.md

awk 'BEGIN{RS="";FS="</script>"}
/script/{
 for (i=1; i<=NF; i++) {
    if ($i ~ /<script>/){
        gsub(/.*script>/,"",$i)
        print $i
    }
 }
}' tree.html > assets/js/knowledge-tree.js

rm tree.html
