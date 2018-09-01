#!/bin/bash

mkdir -p docs
echo '''
  <html><head>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/skeleton.css">
  </head>
''' > docs/index.html
echo '<div class="container"><div class="row">' >> docs/index.html
echo '<div><h1>My Elm stuffs</h1></div>' >> docs/index.html
echo '<div><h3>View source code on <a target="_blank" href="https://github.com/hvnsweeting/elm-exercises/tree/master/web">GitHub</a></h3></div>' >> docs/index.html

pushd web
for p in *.elm
do
    filename=$(basename $p)
    echo $filename
    if grep READY $p; then
        output=$(echo $filename | sed 's/.elm//g').html
        elm-make $p --output ../docs/$output
        echo "<li><a href='./$output'>$output</a></li>" >> ../docs/index.html
    fi
done

for p in */; do
    filename=$(basename $p)
    echo $filename
    if [ $p != elm-stuff ]; then
        pushd $p
        if grep READY *.elm; then
            output=$(echo $filename | sed 's/.elm//g')
            elm-make $output.elm --output ../../docs/$output/elm.js
            echo "<li><a href='./$output/index.html'>$output</a></li>" >> ../../docs/index.html
            cp index.html ../../docs/$output/
        fi
        popd
    fi
done

popd

echo '</div></div></body></html>' >> docs/index.html
echo "Open: file:///$(pwd)/docs/index.html"
