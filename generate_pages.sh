# AMDBFPSE =====================================================================
benchmark="amdbfpse"
datasets="cs phy ps psy"

for dataset in $datasets
do
    runcard_paths=_data/runcards/$benchmark/$dataset

    browse_path=browse/$benchmark/$dataset
    mkdir -p $browse_path

    for runcard in $runcard_paths/*
    do
    filename=$(basename ${runcard})

    echo "---\nlayout: $benchmark\n---" > $browse_path/${filename%.yaml}.html
    done

done

