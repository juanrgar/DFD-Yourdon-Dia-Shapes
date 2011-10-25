#!/bin/sh

BASEURL="https://raw.github.com/juanrgar/DFD-Yourdon-Dia-Shapes/master"
SHEET_DEST="$HOME/.dia/sheets/"
SHAPES_DEST="$HOME/.dia/shapes/"

SHEETS="dfd-yourdon.sheet"
SHAPES="bubble.shape \
bubble.png \
data-store.shape \
data-store.png"

do_exit()
{
    echo "Installation failed"
    exit 1
}

get_shapes()
{
    for shape in $SHAPES
    do
        SHAPE_PATH="$BASEURL/shapes/$shape"
        echo "Downloading $SHAPE_PATH ..."
        curl $SHAPE_PATH -o "$SHAPES_DEST/$shape" || do_exit
    done
}

get_sheet()
{
    for sheet in $SHEETS
    do
        SHEET_PATH="$BASEURL/sheets/$sheet"
        echo "Downloading $SHEET_PATH ..."
        curl $SHEET_PATH -o "$SHEET_DEST/$sheet" || do_exit
    done
}

get_shapes
get_sheet
