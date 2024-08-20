# RanSAP: An Open Dataset of Ransomware Storage Access Patterns

## Purpose of the dataset

Although machine learning and deep learning have become essential components of today's security systems, the lack of a standard and realistic open dataset has made the development of such systems slower and harder. We provide RanSAP, an open dataset of ransomware storage access patterns, to help the development of ML-based ransomware detection systems. The dataset consists of storage access patterns of 7 well-publicized ransomware samples and 5 benign software samples, those of 21 ransomware variants, those on a different version of an operating system, and those on a storage device with full drive encryption (BitLocker) using various types of and various sizes of storage devices.

## For more detail

For more detail about the dataset, you can read the following open access paper.

- M. Hirano, R. Hodota, R. Kobayashi, "RanSAP: An open dataset of ransomware storage access patterns for training machine learning models,
Forensic Science International: Digital Investigation, Volume 40, 2022, https://doi.org/10.1016/j.fsidi.2021.301314.

## Terms of use / License

When using this dataset in your research or other purpose, please cite the following papers:

- M. Hirano, R. Hodota, R. Kobayashi, "RanSAP: An open dataset of ransomware storage access patterns for training machine learning models,
Forensic Science International: Digital Investigation, Volume 40, 2022, https://doi.org/10.1016/j.fsidi.2021.301314.

- M. Hirano and R. Kobayashi, "Machine Learning Based Ransomware Detection Using Storage Access Patterns Obtained From Live-forensic Hypervisor," 2019 Sixth International Conference on Internet of Things: Systems, Management and Security (IOTSMS), 2019, pp. 1-6, https://doi.org/10.1109/IOTSMS48152.2019.8939214.

In addition to the above citations, you can use this dataset under the license in [Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)](https://creativecommons.org/licenses/by-nd/4.0/).

## Download

You can clone this repository or download the ZIP archive from the following Kaggle site:
https://www.kaggle.com/datasets/hiranomanabu/ransap-2022-ransomware-behavioral-features/

## Contents
 
Some large CSV files are compressed in Zip; you can unzip all the files using unzip-all.sh. The following list is the output of list-contents.sh.

```
===================
TOTAL OF ORIGINAL:
===================
NUMBER OF CSV DIRECTORIES: ./dataset/original/
          261 win7-120gb-hdd
          260 win7-120gb-ssd
          262 win7-250gb-hdd
          261 win7-250gb-ssd
===================
TOTAL OF EXTRA:
===================
NUMBER OF CSV DIRECTORIES: ./dataset/extra/
          121 win2008r2-250gb-ssd
          210 win7-250gb-ssd
          120 win7ent_bl-250gb-ssd
===================
TOTAL:
===================
NUMBER OF CSV DIRECTORIES: ./dataset/
          451 extra
          1044 original
```

## CSV format

ata_read.csv

```
UNIX time in sec, UNIX time in ns, LBA, size
1606365711,286027575,6055802,4096
```

ata_write.csv

```
UNIX time in sec, UNIX time in ns, LBA, size, Entropy #1, Entropy #2
1606365710,396368633,6571032,4096,0.32472664320367545,0.259486312315601
```

Note: we did not use Entropy #2 in our paper. While Entropy #1 is calculated in every 4096-byte (4KiB), Entropy #2 is sum of eight entropy that are calculated in every 256-byte. 


## Frequency asked questions

### Q. What tool you used for collecting storage access patterns?

A. The tool we used to collect storage access patterns is a type-I lightweight hypervisor named BitVisor. We created a surveillance function on BitVisor (although the function we developed has not been released yet, you can download and use the original BitVisor from https://github.com/matsu/bitvisor).

### Q. Is this dataset for dynamic or behavioral analysis?

A. Yes. We presented the results of behavioral analysis on our paper based on storage access patterns. We trained the ML model using storage access patterns of the 7 ransomware samples with various conditions. 

### Q. What do you mean by "access pattern" and "storage devices"?

A. We used the word "storage access patterns" for the information of low-level input and output operations on storage devices (i.e., HDD/SSD). When the application runs on an OS, the application calls filesystem API of the OS, the OS then requests input and output operations to HDD/SSD via device driver; it usually uses Direct Memory Access to exchange the information between the OS and the HDD/SSD. We created a surveillance function in the hypervisor layer that collects such operations.

### Q. How much ransomware samples you used? 

A.  In our paper, we trained the ML model using access patterns of the seven ransomware samples with various conditions (e.g., HDD/SSD, 120GB/250GB, different set of decoy files). The dataset directory "original" includes access patterns of the seven ransomware samples. The dataset directory "extra", on the other hand, includes access patterns of 17 Sodinokibi (REvil) variants, those on Windows 2008R2, and those on BitLocker-enabled SSD.

### Q. What do you mean by decoy files? What's the difference between "-w10dirs" (decoy files) and "-largefiles" (large decoy files)? 

A. The decoy files means that files to be encrypted by ransomware samples. We expected that the behavioral patterns will change according to the number and the size of the decoy files because ransomware reads and writes many files in a short time.

The suffix of "-w10dirs" means that ransomware samples were executed on Windows 7 with the directories containing about 9,872 files on the Desktop. The suffix of "-largefiles" means that ransomware samples were executed on Windows 7 with directories with relatively large files between 10MB and 100MB on the Desktop. Please read our paper for the detail.
