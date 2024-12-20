setwd("/Users/Emma/Desktop/UCT\ projects/metaEuk\ pipelines/OCB\ Hackathon")

#numbers are generated through a script in terminal - dataframe in repo.

# Plot bar graphs ---------------------------------------------------------


Assembler <- read.delim("HS039a.txt", header=TRUE)


#Assembler bar plot- %
A <- ggplot(Assembler, aes(x = Alias, y = perc_unannotated, fill = Assembler)) + 
  geom_bar(stat = "identity") +   
  labs(title = "Assembler", x = "Lab", y = "% unannotated") + 
  theme_minimal()           
B <- ggplot(Assembler, aes(x = Alias, y = unannotated, fill = Assembler)) + 
  geom_bar(stat = "identity") +   
  labs(title = "Raw unannotated by assembler", x = "Lab", y = "% unannotated") + 
  theme_minimal()      
ggsave("Assembler.pdf", A, width=6, height=4.5 )

#by Functional database:
B <- ggplot(Assembler, aes(x = Alias, y = perc_unannotated, fill = Functional_database)) + 
  geom_bar(stat = "identity") +  
  labs(title = "Functional database", x = "Lab", y = "% unannotated") + 
  theme_minimal()      
ggsave("func_database.pdf",B, width=6, height=4 )

#by gene calling method
C <- ggplot(Assembler, aes(x = Alias, y = perc_unannotated, fill = Protein_prediction_gene_calling)) + 
  geom_bar(stat = "identity") +   
  labs(title = "Gene calling method", x = "Lab", y = "% unannotated") + 
  theme_minimal()      
ggsave("gene_calling.pdf",C, width=6, height=4 )

#rRNA removal method
D <- ggplot(Assembler, aes(x = Alias, y = perc_unannotated, fill = rRNA_removal)) + 
  geom_bar(stat = "identity") +  
  labs(title = "rRNA removal method", x = "Lab", y = "% unannotated") + 
  theme_minimal()       
D  
ggsave("rRNA_removal.pdf",D, width=6, height=4)

E <- ggplot(Assembler, aes(x = Alias, y = perc_unannotated, fill = Trimmer)) + 
  geom_bar(stat = "identity") +  
  labs(title = "Trimmer", x = "Lab", y = "% unannotated") + 
  theme_minimal()       
E  
ggsave("Trimmer.pdf",E, width=6, height=4)



# unannotated versus total proteins ------------------------------------------------

# Load ggplot2 library
library(ggplot2)
library(ggpmisc)

# Create the scatter plot
ggplot(Assembler, aes(x = unannotated, y = Total)) +
  geom_point(color = "blue", size = 3) +  geom_smooth(method = "lm", se = FALSE, color = "blue") +         # Scatter points with custom color and size
  labs(title = "raw unannotated proteins as a function of Total proteins", 
       x = "raw unannotated", 
       y = "Total") +                           # Add axis labels and title
  theme_minimal()  +                                    # Minimal theme
  # Add R-squared and equation annotation using ggpmisc
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               formula = y ~ x, parse = TRUE, 
               label.x.npc = "left", label.y.npc = "top",
               color = "black")     
