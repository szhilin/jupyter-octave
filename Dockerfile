FROM jupyter/minimal-notebook

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends octave \
        octave-interval \    
        gnuplot ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

RUN conda install --quiet --yes \
    'octave_kernel' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
