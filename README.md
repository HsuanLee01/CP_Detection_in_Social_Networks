Research Repository
===

Changepoint Inference in REH of a Social Network

---
This repository includes all the required files to replicate the simulation study of Hsuan Lee's "Changepoint inferece in Relational Event History data of a Social Network". 
Software requirements is R (http://www.r-project.org}.

---

| Files/Folders          | Description   |
| -----------------      | ------------- |
|Latex_ResearchReport     |The Latex file for creating ResearchReport_PDF.pdf|
|Synthetic_Data           |The folder contains 10 synthetic datasets produced from [1]Synthetic_Data.rmd|
|[1]Synthetic_Data.rmd    |Rmd file for producing synthetic datasets (REH data)|
|[2]MW_Parameters.rmd     |Rmd file to extract the parameters given by windows over time|
|[3]Changepoint_Detection |Rmd file that detects the changepoints according to the parameters given by windows. Note: Please run [2]MW_Parameters.rmd before running this file|
|ResearchReport_PDF.pdf   |Pdf file of the research report.|

For any questions regarding the above documents, please contact Hsuan Lee(h.lee@uu.nl)
