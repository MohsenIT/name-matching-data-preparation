# Collective name matching datasets
To evaluate Swash framework, three publicly available data sets are utilized:
1. **CiteSeer**: the CiteSeer dataset was initially created by (Giles, Bollacker, & Lawrence, 1998). This dataset contains citations of four different areas of machine learning. Aron Culotta and Andrew McCallum later provided the ground truth of the dataset (Culotta & McCallum, 2005).
2. **ArXiv (HEP)**: the ArXiv dataset is collected from high-energy physics publications. It was initially used in KDD Cup 2003. David Jensen, from the University of Massachusetts, provided the author entity labels for this dataset (McGovern et al., 2003).
3. **DBLP**: This dataset is a subset of the Digital Bibliography & Library Project (DBLP), which is labeled by Patrick Reuther (Reuther, 2006). He has provided three different subsets., that the largest of them (DBLP-SUB-03) is used in this research.

These three datasets have different features such as paper name and author venue, which are ignored for name matching. Only person names and their corresponding entity labels are used in the proposed name matching framework. Table 1 reports several statistics on these datasets. The number of author entities on the DBLP dataset is unavailable due to the lack of entity labels for all references. The dataset has 2018 name pairs, which are different representations of the same entities. In contrast, ArXiv and CiteSeer contain the entity labels of all references in datasets. _It is notable that the DBLP dataset is also collective, but it's entity labels are not complete (only 2018 pairs are available)._

<em>Table 1. Statistics of three datasets</em>
  
| Statistic                     | CiteSeer | ArXiv  | DBLP   | 
|-------------------------------|----------|--------|--------| 
| Number of author names        | 2,892    | 58,515 | 58,399 | 
| Number of unique author names | 1,636    | 12,732 | 21,688 | 
| Number of author entities     | 1,159    | 8,882  | ?      | 
| Average tokens per name       | 2.4      | 2.4    | 2.5    | 

## Labeling Errors

According to our investigation, there are many errors in the orginal labels of above dataset. Complex name variations, such as changing the order of tokens, were hidden from the sight of manual taggers. The resolved ids of 665 records on ArXiv and 32 records on CiteSeer are manually merged or fixed during our correction.
