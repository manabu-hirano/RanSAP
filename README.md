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

## Bulk Download

You can clone this repository, or bulk download the dataset in a single .tgz file from the following link.
- https://kosenjp-my.sharepoint.com/:u:/g/personal/hirano_manabu_toyota_kosen-ac_jp/ESN5o9PvRLNOiCEKJ_1wBfYBl3b_05trKZ4Raxb0GnRcNQ

## Contents
 
Some large CSV files are compressed in Zip; you can unzip all the files using unzip-all.sh. The following list is the output of list-contents.sh.

```
===================
ORIGINAL:
===================
NUMBER OF CSV FILES: ./dataset/original/
	  261	 (CSV	  215	 ZIP	  46 )	 win7-120gb-hdd
	  260	 (CSV	  129	 ZIP	  131 )	 win7-120gb-ssd
	  262	 (CSV	  227	 ZIP	  35 )	 win7-250gb-hdd
	  261	 (CSV	  140	 ZIP	  121 )	 win7-250gb-ssd
===================
EXTRA:
===================
NUMBER OF CSV FILES: ./dataset/extra/
	  121	 (CSV	  58	 ZIP	  63 )	 win2008r2-250gb-ssd
	  210	 (CSV	  1	 ZIP	  209 )	 win7-250gb-ssd
	  120	 (CSV	  89	 ZIP	  31 )	 win7ent_bl-250gb-ssd
===================
TOTAL:
===================
NUMBER OF CSV FILES: ./dataset/
	  451	 (CSV	  148	 ZIP	  303 )	 extra
	  1044	 (CSV	  711	 ZIP	  333 )	 original
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

Note: we did not use Entropy #2 in our paper
