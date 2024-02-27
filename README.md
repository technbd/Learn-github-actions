## Self-hosted GitHub Runner:

Setting up a self-hosted GitHub runner on Ubuntu involves several steps. Here's a general guide on how to do it:


### Download the Runner Binary:

- Visit your repository on GitHub.
- Go to Settings -> Actions -> Runners.
- Click "New self-hosted runner".
- Select "Linux".
- Copy the download and configure scripts. See below for examples: 


```
### Create a folder:

mkdir actions-runner && cd actions-runner 


### Download the latest runner package:

curl -o actions-runner-linux-x64-2.313.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.313.0/actions-runner-linux-x64-2.313.0.tar.gz


### Optional: Validate the hash:

echo "56910d6628b41f99d9a1c5fe9df54981ad5d8c9e42fc14899dcc177e222e71c4  actions-runner-linux-x64-2.313.0.tar.gz" | shasum -a 256 -c


### Extract the installer:

tar xzf ./actions-runner-linux-x64-2.313.0.tar.gz
```


### Configure:

```
### Create the runner and start the configuration:

./config.sh --url https://github.com/your_username/your_repository --token YOUR_TOKEN


--------------------------------------------------------------------------------
|        ____ _ _   _   _       _          _        _   _                      |
|       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
|      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
|      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
|       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
|                                                                              |
|                       Self-hosted runner registration                        |
|                                                                              |
--------------------------------------------------------------------------------

# Authentication


√ Connected to GitHub

# Runner Registration

Enter the name of the runner group to add this runner to: [press Enter for Default]	[-> Hit Enter]
Enter the name of runner: [press Enter for node02]	gh-runner-01

This runner will have the following labels: 'self-hosted', 'Linux', 'X64'
Enter any additional labels (ex. label-1,label-2): [press Enter to skip]	label-1,label-2

√ Runner successfully added
√ Runner connection is good

# Runner settings

Enter name of work folder: [press Enter for _work]	[-> Hit Enter]

√ Settings Saved.

```


### Last step, run it:

```
./run.sh


√ Connected to GitHub

Current runner version: '2.313.0'
2024-02-27 06:34:24Z: Listening for Jobs
```

Your self-hosted GitHub runner is now ready and you can check its status from the Runners section of your GitHub repository. 


### Sudo Password:
If the running is prompting for the user’s password in order to run sudo. Enter the password. Then runner now completes successfully. 


The issue with the previous workflow pausing to receive password input is caused by sudo requiring the user to enter its password. This can be solved by removing the requirement for a password for this user to run sudo.

```
2024-02-27 09:51:17Z: Running job: install-make-pkg

[sudo] password for idea:
2024-02-27 09:52:12Z: Job install-make-pkg completed with result: Succeeded
```


```
sudo visudo

### Add the following line:
<user_name>    ALL=(ALL) NOPASSWD:ALL
```

Run the workflow again and verify that a password is not required.



### Using your self-hosted runner:

```
### Use this YAML in your workflow file for each job:

runs-on: self-hosted
```









### Links:

- [Find out more](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)


This guide provides a basic setup. Depending on your specific requirements, you may need to adjust configurations or add additional steps.