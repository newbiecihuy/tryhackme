https://tryhackme.com/room/yara

 Introduction
 
  What is Yara?
  1. What is the name of the base-16 numbering system that Yara can detect?
  ans : hex
  2. Would the text "Enter your Name" be a string in an application? (Yay/Nay)
  ans : Yay
  
  Installing Yara (Ubuntu/Debian & Windows)
  Deploy
  
  Introduction to Yara Rules
  Expanding on Yara Rules
  Yara Modules
  Other tools and Yara
  Using LOKI and its Yara rule set
  1. Scan file 1. Does Loki detect this file as suspicious/malicious or benign?
  python loki.py -p ~/suspicious-files/file1/
  ans : suspicious
  2. What Yara rule did it match on?
  ans : webshell_metaslsoft
  3. What does Loki classify this file as?
  ans : Web Shell
  4. Based on the output, what string within the Yara rule did it match on?
  ans : str1
  5. What is the name and version of this hack tool?
  ans : b374k 2.2
  6. Inspect the actual Yara file that flagged file 1. Within this rule, how many strings are there to flag this file?
  ans : 1
  7. Scan file 2. Does Loki detect this file as suspicious/malicious or benign?
  sudo python loki.py -p ~/suspicious-files/file2/
  ans : benign
  8. Inspect file 2. What is the name and version of this web shell?
  cd ~/suspicious-files/file2
  head 1ndex.php
  ans : b374k  3.2.3
  Creating Yara rules with yarGen
  cd ~/tools/yarGen
  python3 yarGen.py -m /home/cmnatic/suspicious-files/file2 --excludegood -o /home/cmnatic/suspicious-files/file2.yar
   1. From within the root of the suspicious files directory, what command would you run to test Yara and your Yara rule against file 2?
   ans : yara file2.yar file2/1ndex.php
   2. Did Yara rule flag file 2? (Yay/Nay)
   ans : Yay
   3. Test the Yara rule with Loki, does it flag file 2? (Yay/Nay)
   ans : Yay
   4. What is the name of the variable for the string that it matched on?
      cp file2.yar ~/tools/Loki/signature-base/yara
      ans : Zepto
   5. Inspect the Yara rule, how many strings were generated?
      cat ~/suspicious-files/file2.yar
      ans : 20
   6. One of the conditions to match on the Yara rule specifies file size. The file has to be less than what amount?
      condition:
      uint16(0) == 0x3f3c and filesize < 700KB and
      1 of ($x*) and 4 of them
      ans : 700kb
      
      Valhalla
    1. Enter the SHA256 hash of file 1 into Valhalla. Is this file attributed to an APT group? (Yay/Nay)
    python ~/tools/Loki/loki.py -p ~/suspicious-files/file1
    ans : Yay
    2.Do the same for file 2. What is the name of the first Yara rule to detect file 2?
    Get the hash
      python ~/tools/Loki/loki.py -p ~/suspicious-files/file2
    ans :Webshell_b374k_rule1
    3. Examine the information for file 2 from Virus Total (VT). The Yara Signature Match is from what scanner?
    ans : THOR APT Scanner
    4. Enter the SHA256 hash of file 2 into Virus Total. Did every AV detect this as malicious? (Yay/Nay)
    ans : Nay
    5. Besides .PHP, what other extension is recorded for this file?
    ans : exe
    6. What JavaScript library is used by file 2?
    ans : 
