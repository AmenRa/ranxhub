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

# MSMARCO Passage ==============================================================
benchmark="msmarco-passage"
datasets="dev trec-dl-2019 trec-dl-2020"

for dataset in $datasets
do
    runcard_paths=_data/runcards/$benchmark/$dataset

    browse_path=browse/$benchmark/$dataset
    mkdir -p $browse_path

    for runcard in $runcard_paths/*
    do
    filename=$(basename ${runcard})

    echo "---\nlayout: $benchmark-$dataset\n---" > $browse_path/${filename%.yaml}.html
    done

done

