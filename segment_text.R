library(dplyr)
library(stringr)

# Function to handle a single text string, returning a DataFrame of results
process_text <- function(docID, text_string) {
  # Segment by non-alphabetic begin
  fragments_begin <- unlist(strsplit(text_string, "(?=[^A-Za-z\\s][A-Za-z])", perl = TRUE))
  
  # Further segment by non-alphabetic end
  fragments_final <- unlist(lapply(fragments_begin, function(fragment) {
    strsplit(fragment, "(?<=[A-Za-z])(?=[^A-Za-z\\s]|$)", perl = TRUE)
  }))
  
  # Extract only alphabetic fragments
  alphabetic_fragments <- stringr::str_extract(fragments_final, "[A-Za-z\\s]+[A-Za-z]")
  
  # Return a DataFrame with all fragments and their alphabetic parts, including docID
  data.frame(docID = rep(docID, length(fragments_final)),
             fragments = fragments_final, 
             detected_fragments = alphabetic_fragments, 
             stringsAsFactors = FALSE)
}

# Main function to process a DataFrame with docID and text columns
segment_text <- function(df) {
  # Apply the process_text function to each row of the DataFrame
  results <- do.call(rbind, lapply(seq_len(nrow(df)), function(i) {
    process_text(df$docID[i], df$text[i])
  }))
  
  return(results)
}



# Example usage


text_string <- "YOUR_INPUT"
v_str <- c(text_string, "Another example: xxx Example.", "No special characters here")

# Assuming 'df' is your DataFrame with docID and text columns
df <- data.frame(docID = seq(length(v_str)), 
                 text = v_str,
                 stringsAsFactors = FALSE)

# Apply the segmentation function
segmented_results <- segment_text(df)
print(segmented_results)

