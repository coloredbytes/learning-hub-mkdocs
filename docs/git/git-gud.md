<figure markdown="span">
![HEADER](_assets/images/git.png){ width="100" height="100" }
<figcaption>Setting up Git 🚀 </figcaption>
</figure>

# Welcome :wave:

## Intro

Hello Ladies and Germs, To my class on how to **`Git Gud`**. I'll be showing you how to install git on your machines and also adding ssh keys and stuff.

## Installing Git

Installing Git is easy I'll be showing you how to on **Windows** and **Ubuntu** here.

- Windows
```pwsh
winget install git.git
```

- Ubuntu

```shell
sudo apt install git
```
<br>

As I said it is dead simple. The next step is configuring.

## Configuring Git

This part can be weird at times but luckily for you, I have scripted this part.

- Windows
```pwsh
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/coloredbytes/learning-hub-mkdocs/main/_assets/git-config.ps1" -OutFile "git-config.ps1"
```
- Linux (curl is os agnostic)
```shell
curl -o git-config.sh "https://raw.githubusercontent.com/coloredbytes/learning-hub-mkdocs/main/_assets/git-config.sh"
```

Once you have the files down for the system you're running just run the scipt by doing a

- `./git-config.ps1`

or

- `./git-config.sh`

This will ask for the email and username you want to use on commits for [**GitHub**](https://github.com/). Along with settings I think are the best for using git.

## Adding SSH Keys

SSH Keys are a key part of using Git in my opinion. Make it easier to clone and some Sites like **GitHub**** do not allow pushing via HTTPS.

Lucky for us creating an SSH key is the same on every platform. Below I'll show you how this is done.

```shell
cd .ssh
ssh-keygen -t ed25519 -C "GitHub"
```

I'll explain the bits here.

- `ssh-keygen`: The Command to generate the key.
- `-t ed25519`: The type of key to be generated in this case **ed25519**.
- `-C "GitHub"` This is a comment to be added to be the key, It is optional but helps me with what the keys are besides the name.

After that command is run it will ask what you want the name of the file to be. In this case, just type GitHub to make it easier. After that key is generated we need to add something to the ssh config but also add this key to GitHub.

```
Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/keys/github/GitHub
        IdentitiesOnly=yes
```
This will make it so when you're doing git commits with SSH that it only uses that key and ignores the rest of the SSH config. I suggest this go at the top of the config.

Once that is done follow this [Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) to add the key to your account. After that, we can test it with this command.

```shell
ssh -T git@github.com
```
> [!NOTE]
> Hi coloredbytes! You've successfully authenticated, but GitHub does not provide shell access.

If configured correctly you should get some output like this. If so congrats git is configured and we can start doing some fun stuff.








