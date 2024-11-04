
#!/bin/bash
# See instructions at https://pypi.org/project/openai-whisper/

echo "------------------------------------------------------------------------"
echo " OpenAI Whisper"
echo "------------------------------------------------------------------------"

if command -v whisper > /dev/null 2> /dev/null
then
    echo "OpenAI Whisper is already installed"
else
    echo "Installing OpenAI Whisper..."
    bash install/helper-apt.sh ffmpeg ffmpeg "FF mpeg"
    pip3 install -U openai-whisper >> ~/.provision.log 2>> ~/.provision.log
    pip3 install git+https://github.com/openai/whisper.git
    pip3 install --upgrade --no-deps --force-reinstall git+https://github.com/openai/whisper.git
    pip3 install setuptools-rust >> ~/.provision.log
fi

echo "Completed OpenAI Whisper configuration"
echo " "