FROM alpine/ansible AS base
RUN apk update && apk add zsh nano nano-syntax curl sshpass && curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
RUN echo "if [[ -z \"\$SSH_AUTH_SOCK\" ]] ; then" >> ~/.profile && echo "    eval \"\$(ssh-agent -s)\"" >> ~/.profile && echo "fi" >> ~/.profile && echo "ssh-add /root/.ssh/ed25519_ovh_new" >> ~/.profile
ENTRYPOINT ["/bin/zsh"]
