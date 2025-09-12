# Steps to setup docker environment on Android without root
1. Download [Termux](https://play.google.com/store/apps/details?id=com.termux)

2. Run the following in Termux:<br>
    ```shell
    pkg install qemu-utils qemu-common qemu-system-x86_64-headless

    mkdir alpine && cd $_
    wget http://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-virt-3.12.3-x86_64.iso

    qemu-img create -f qcow2 alpine.img 4G
    ```

3. Boot up the Alpine Linux
    ```shell
    qemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64 \
    -drive if=pflash,format=raw,read-only,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
    -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 \
    -cdrom alpine-virt-3.12.3-x86_64.iso \
    -nographic alpine.img
    ```
    
4. Login as `root` and setup for installation:<br>
    1. Setup the internet
        ```shell
        localhost:~# setup-interfaces
        Available interfaces are: eth0.
        Enter '?' for help on bridges, bonding and vlans.
        Which one do you want to initialize? (or '?' or 'done') [eth0] 
        Ip address for eth0? (or 'dhcp', 'none', '?') [dhcp] 
        Do you want to do any manual network configuration? [no] 
        localhost:~# ifup eth0
        ```
    2. Setup to install the disk
        ```shell
        wget https://github.com/saikrishnasaski/answerfile/blob/main/answerfile

        sed -i -E 's/(local kernel_opts)=.*/\1="console=ttyS0"/' /sbin/setup-disk

        setup-alpine -f answerfile
        ```
    3. Run `poweroff` to exit.

5. Allow access by shell script:
    ```shell
    echo "qqemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64 -drive if=pflash,format=raw,read-only,file=$PREFIX/share/qemu/edk2-x86_64-code.fd -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 -nographic alpine.img" >> login_to_vm.sh

    chmod +x login_to_vm.sh
    ```
    Run `./login_to_vm.sh` to login from now on.

6. In the alpine 'VM', install docker and enable on boot:
    ```shell
    apk update && apk add docker

    service docker start

    rc-update add docker
    ```

## Verify
Run `docker run hello-world` and check result