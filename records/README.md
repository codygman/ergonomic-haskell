# records

0 to running this code in your `/tmp` directory:

```
$ echo "I'm testing this on $(date +"%F %X")"
I'm testing this on 2020-09-08 12:26:08 PM
$ cd /tmp
$ git clone --depth=1 https://github.com/codygman/ergonomic-haskell.git
Cloning into 'ergonomic-haskell'...
remote: Enumerating objects: 20, done.        
remote: Counting objects: 100% (20/20), done.        
remote: Compressing objects: 100% (14/14), done.        
remote: Total 20 (delta 1), reused 14 (delta 0), pack-reused 0        
Unpacking objects: 100% (20/20), 5.33 KiB | 2.67 MiB/s, done.
$ cd ergonomic-haskell/records
$ stack run

... build logs ...

Good day, codygman
Your dog's name: doggo
Your cat's name: doggo
One second.. there's been a mix up it seems!
Your cat's favorite ball type: doggo
```
