# Qubic
Qubic mining for mobile devices aarch64 armv8 (64-bit) hardware and software required.
![](Images/qubic.png)

# Installation:
1. Download & install latest .apk from Apkmirror or Google Play Store
[Userland](https://www.apkmirror.com/apk/userland-technologies-incorporated/userland/userland-24-04-03-release/userland-linux-on-android-24-04-03-2-android-apk-download):
![](Images/userland.png)

3. Open Userland app and install Ubuntu accept permissions, we will use minimal environment and terminal or CLI this can take a couple minutes...:
![](Images/ubuntu.png)
![](Images/environment.png)![](Images/terminal.png)

4. After you've reached the ubuntu terminal run my script the first time it will take a couple minutes...:
![](Images/welcome.png)
```
curl -o- -k https://raw.githubusercontent.com/Darktron/Qubic/main/qubic.sh | bash && cd ~/qubic
```

4. After script is done you should be in the directory `userland@localhost:~/qubic$` now you can verify if the miner file `rqiner-aarch64` exists with `ls` command.
![](Images/rqiner.png)

# Usage:
1.Get a Qubic wallet, I used the [Qubic Web Wallet](https://wallet.qubic.org/)

2. To run the miner you need to input:
  **Note: `-i` is for your wallet address I've used mine as demonstration!**
```
~/qubic/rqiner-aarch64 -t 8 -i QGSHWDUIVUCZHBURPKGQSASOOGVCGRHKKHCNYHTOKEWAHDVPPOJFDFZAAHEH -l Donations
```
3. To stop the miner use: `CTRL + c`

4. To view your worker at pool visit: [Qubic.Commando.sh](https://qubic.commando.sh/) then input your wallet address and load stats.
  Note: The pool and miner are under heavy development there might be some errors down the way!

# Miner options:
```
High performance Qubic CPU miner powered by Rust

Usage: rqiner-aarch64 [OPTIONS] --threads <THREADS> --id <ID> --label <LABEL>

Options:
  -t, --threads <THREADS>            Amount of threads used for mining
  -i, --id <ID>                      Your payout Qubic ID (required for pool mining)
  -x, --extended-reporting           Report it/s from individual threads
  -l, --label <LABEL>                Label used for identification of your miner on the pool
      --no-pplns                     Opt-out of PPLNS mode
      --enable-hugepages             Enable hugepages for algo data storage
  -c, --idle-command <IDLE_COMMAND>  (Optional) Command will be run once during idle periods and killed on mining periods
  -h, --help                         Print help
  -V, --version                      Print version
```
# All Credits to Qubic-Solutions community!
