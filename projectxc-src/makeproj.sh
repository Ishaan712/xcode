#!/bin/sh

set -e

fixup_proj=./fixup_proj

indir=$(dirname "$1")
inproj=$(basename "$1")
if [ "$indir" = "." ]; then
  indir="templates"
fi
outdir=$(dirname "$2")
outproj=$(basename "$2")

if [ "$1" = "" ]; then
  echo "No input project specified"
elif ! [ -e "$1" ]; then
  echo "Input project does not exist"
elif [ "$2" = "" ]; then
  echo "No output project specified"
elif [ -e "$2" ]; then
  echo "Output project already exists"
elif ! [ -e "$fixup_proj" ]; then
  echo "$fixup_proj program does not exist"
else
  mkdir "$outdir/$outproj"
  cp -p -R "$indir/$inproj/$inproj" "$outdir/$outproj/$outproj"
  mkdir "$outdir/$outproj/$outproj.xcodeproj"
  $fixup_proj pbxproj "$indir/$inproj/$inproj.xcodeproj/project.pbxproj" "$outdir/$outproj/$outproj.xcodeproj/project.pbxproj" "$inproj" "$outproj"
  $fixup_proj xml "$indir/$inproj/$inproj/Base.lproj/Main.storyboard" "$outdir/$outproj/$outproj/Base.lproj/Main.storyboard" "$inproj" "$outproj"
  mkdir "$outdir/$outproj/$outproj.xcodeproj/project.xcworkspace"
  $fixup_proj xml "$indir/$inproj/$inproj.xcodeproj/project.xcworkspace/contents.xcworkspacedata" "$outdir/$outproj/$outproj.xcodeproj/project.xcworkspace/contents.xcworkspacedata" "$inproj" "$outproj"
  echo "Project created - open $outdir/$outproj/$outproj.xcodeproj in Xcode"
fi
