while read line <&3; do
  for ver in {depth,left,right}; do
    echo '---> Doing' $line $ver
    vid_fname=../videos/train/${line}_${ver}.avi
    outdir=../frames/train/${line}_${ver}
    mkdir -p $outdir
    cmd="ffmpeg -i $vid_fname -r 6 -qscale 1 $outdir/image-%3d.png"
    echo "---> running " $cmd
    $cmd
    pwd
  done
done 3< ../lists/train.txt
