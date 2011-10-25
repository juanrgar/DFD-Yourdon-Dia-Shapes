#!/bin/sh

BASEURL="https://raw.github.com/juanrgar/DFD-Yourdon-Dia-Shapes/master"

DIA_HOME="$HOME/.dia"
SHEET_DEST="$DIA_HOME/sheets/"
SHAPES_DEST="$DIA_HOME/shapes/"

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
        curl --create-dirs $SHAPE_PATH -o "$SHAPES_DEST/$shape" || do_exit
    done
}

get_sheet()
{
    for sheet in $SHEETS
    do
        SHEET_PATH="$BASEURL/sheets/$sheet"
        echo "Downloading $SHEET_PATH ..."
        curl --create-dirs $SHEET_PATH -o "$SHEET_DEST/$sheet" || do_exit
    done
}

if [ ! -d $DIA_HOME ]; then
    echo "Try to run Dia first"
    do_exit
fi

get_shapes
get_sheet
