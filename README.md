
# Text Segmentor Tool

This repository contains an R script designed to segment the multilingual text into alphabetic fragments for further translation or other tasks, useful for text analysis and preprocessing tasks. 
It makes use of the `dplyr`, `stringr` and some R base functions to handle text processing.

## Overview

The `process_text` function takes a single text string and a document ID, segments the text based on non-alphabetic characters, and extracts alphabetic fragments. This is particularly useful in NLP preprocessing steps where non-alphabetic characters need to be identified, translated or removed.

The `segment_text` function applies the `process_text` function across a DataFrame that contains multiple text entries, allowing batch processing of text data.

## Installation

To run this script, you will need to use R.

Additionally, you will need to install the `dplyr` and `stringr` packages. You can install these packages using the following commands in R:

```r
# install.packages("tidyverse")

install.packages("dplyr")
install.packages("stringr")
```

## Usage

Here's how to use this script:

1. **Prepare Your Data**: Your data should be in a DataFrame with at least two columns: `docID` and `text`. The `docID` is a unique identifier for each document or text entry, and `text` contains the string data to be processed.

2. **Load and Run the Script**: You can source the script in R and call the `segment_text` function with your DataFrame.

Example:

```r
library(dplyr)
library(stringr)

# Assuming 'df' is your DataFrame with docID and text columns
df <- data.frame(docID = 1:3,
                 text = c("Example text 1.", "Another example: xxx Example.", "No special characters here"),
                 stringsAsFactors = FALSE)

# Apply the segmentation function
segmented_results <- segment_text(df)
print(segmented_results)
```

## Contributing

Contributions to this project are welcome! Here are a few ways you can help:

- **Report Bugs**: Use the [Issues](https://github.com/jackyrx/text-segmentor-tool/issues) section to report any bugs in the script.
- **Suggest Enhancements**: Have ideas on how to improve this script? Share them in the Issues section or submit a pull request (PR).
- **Improve Documentation**: Found a typo or think something could be clearer? Submit a pull request with your suggested changes.
