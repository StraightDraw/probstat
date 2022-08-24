# P1 Outcomes, Event Sets and Probability

## This page is under construction.

A roulette ball falling into its slot and a card drawn from a well-shuffled deck are two example of probability experiments. A *probability experiment* is any event whose outcomes are perfectly *random* and exactly predicted by probabilities. The *probability space* is the collection of all possible *outcomes* of the experiment. A *simple random sample* (SRS) is a collection of outcomes drawn at random from the probability space $S$.

An *event* is set of *outcomes*. We use set notation: an event $A$ is a subset of the probability space $S$. Determining probabilities requires counting: we simply count the number of outcomes in event $A$ and divide by the number of outcomes in $S$. To simplify our work, we will use the *cardinality* operator $|A|$ to indicate the number of elements (outcomes) in set (event) $A$. 

## Definition of Probability

The definition of probability is a straightforward formula:

$$P(A)=\frac{|A|}{|S|}$$

Probability calculations become counting exercises where we determine the cardinality of the event set and the probability space itself.

### Probability Playground: Deck of Playing Cards

Most probability ideas can be quickly illustrated using a deck of cards and random draws.The standard deck has ready-made subsets and partitions which help illustrate important ideas. For those unfamiliar with a standard deck of playing cards, there are the thirteen *values* (sometimes called ranks) and four *suits*: $\spadesuit,\heartsuit, \clubsuit,\diamondsuit}$. The entire deck is shown below. 

````{note}
We use T for the value 10 so every value has a single-symbol code.}:
````

-------------------------------------------------------------------

| $\spadesuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\heartsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\diamondsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\clubsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

-------------------------------------------------------------------


Half the cards are red, half black. Each suit subset has 13 cards in it. Each value subset has four cards. For example, the set $J=\{J\spadesuit,J\heartsuit, J\clubsuit,J\diamondsuit\}$

Whenever we refer to "drawing a card," we mean that a standard deck of 52 playing cards has been well-shuffled and that the draw is perfectly random. Each card has an equal probability of being drawn. We never include jokers or wild cards.

### First Glance: Sets and Probabilities

````{admonition} Example
:class: note
Suppose we draw a single card at random from a well-shuffled standard deck of 52 cards. What is the probability of drawing a heart? Of \emph{not} drawing a heart?
````
**Solution.** Let the probability space $S$ be comprised of all possible outcomes  when drawing one card at random from a standard deck of playing cards. Let $H$ be the event set of drawing a heart ($\heartsuit$). Then $|H|=13$ because there are 13 possible $\heartsuit$ outcomes in $S$. Thus:
$$P(A)=\frac{|H|}{|S|}=\frac{13}{52}=\frac{1}{4}$$

The probability of "not drawing a heart" inquires about the probability of the *set complement* of the event set $H$ and is denoted $\bar H$. The probability of the complement of an event set is given by:

$$P(\bar H)=1-P(H)$$

Because $|\bar H|=|S|-|H|$, we have:

$$\begin{align*}
    P(\bar H)&=\frac{|\bar H|}{|S|}\\&=\frac{|S|-|H|}{|S|}\\&=\frac{|S|}{|S|}+\frac{|H|}{|S|}\\&=1-\frac{|H|}{|S|}
\end{align*}$$

To conclude the example from above:$$P(\bar H)=1-\frac{1}{4}=\frac{3}{4}$$

## Partitions

If two events sets $A$ and $B$ are disjoint, e.g. if $A\cap B = \emptyset$, then

$$P(A\cup B)=P(A)+P(B)$$

If the intersection of event sets is non-empty, life gets complicated quickly. Disjoint event sets are so helpful we will use the idea of partitions often to break down complicated events into digestible pieces.

Partition
: A collection of subsets of the probability space $S$ such that the subsets $A_1, A_2, \dots , A_n$ have the following properties:
1. They are non-empty,
2. They are \emph{pairwise disjoint}, and
3. Their union is $S$.

Property (2) guarantees that every possible intersection of these subsets is empty:

$$A_i\cap A_j=\emptyset \hspace{5mm}\forall\ i\neq j\in\{1,2,\dots,n\}$$

Property (3) ensures that every outcome in the probability space can be found in one of the subsets in the partition. Both are extremely helpful when simplifying probability problem-solving situations.

We have two primary partitions in the standard deck of playing cards: values and suits. Consider the four suits. Each suit is a non-empty set because it has 13 elements. A card can be only one suit, so spades and hearts are disjoint as is every pair of possible suits. Finally, $S=\{\spadesuit,\heartsuit, \clubsuit,\diamondsuit\}$. Thus, the suits are subsets that form a partition.

Let us define a few additional subsets in the standard deck of playing cards:

$E$ Even: $2,4,6,8,T,Q$ in all suits
$O$ Odd: $A,3,5,7,9,J,K$ in all suits
$F$ Faces: $J, Q,K$ (cards with person pictured) in all suits
$A$ Aces in all suits
$N$ Numbered: $2,3,4,5,6,7,8,9,T$

Note two more partitions are readily available: $E\cup O=S$ and $F\cup A \cup N=S$.

````{admonition} Example
:class: note
A card is drawn at random from a deck of playing cards. Find the probability that the card is:
* A heart \emph{or} even.
* A heart \emph{and} even.
* Even but not a heart.
````

Let $S$ represent the probability space, and let event sets $E$ and $H$ represent drawing an even card or a heart respectively. The situation in part (a) is shown below.


-------------------------------------------------------------------

| $\spadesuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\heartsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\diamondsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\clubsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

-------------------------------------------------------------------


The intersection of $E$ and $H$ is non-empty, namely, the six even hearts, so we cannot just add. Trying to calculate $$P(H\text{ or }E)\overset{??}{=}P(H)+P(E)=\frac{1}{4}+\frac{1}{2}=\frac{3}{4}$$ we produce an incorrect answer because the six even hearts would be counted twice, once in the first fraction and again in the second. We must add a third term to deal with the double-counting:

$$\begin{align*}
P(H\text{ or }E)&=P(H\cup E)\\&=
P(H)+P(E)-P(H\cap E)\\&=\frac{13}{52}+\frac{26}{52}-\frac{6}{52}\\&=\frac{33}{52}    
\end{align*}$$

For part (b), we have

$$P(H\text{ and } E)=P(H\cap E)=\frac{6}{52}=\frac{3}{26}$$

For part (c) we will need set subtraction notation: $A-B=$ is the set of all elements in $A$ that are not in $B$. In terms of set operations we have:

$$A-B=A\cap \bar B$$

which is shown in Figure {ref}`AthrowawayB`

```{figure} images/ProbFig1.png
---
height: 300px
name: AthrowawayB
---
Set $A$ "throw away" set $B$ ($A-B$)
```


The blue shaded area is $\bar B$, so when we take $A\cap \bar B$, we gather all elements of A that are not in B, as required. The situation for our example is demonstrated below


-------------------------------------------------------------------

| $\spadesuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\heartsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\diamondsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\clubsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

-------------------------------------------------------------------


Using set operations, we have:

$$\begin{align*}
P(E\text{ and not }H)&=P(E - H)\\
&=P(E\cap \bar H)\\
&=P(E)-P(H\cap E)\\
&=\frac{26}{52}-\frac{6}{52}\\
&=\frac{5}{13}    
\end{align*}$$

````{admonition} Example
:class: note
A card is drawn at random from a deck of playing cards. Find the probability that the card is a heart ($\heartsuit$) or is even or is a face card.
````

**Solution.** Clearly, counting all the non-heart, non-even, non-face would be easy,of which cards there are: 

$$P(H\cup E \cup F)=1-P(\overline{H\cup E \cup F})=\frac{52-15}{52}=\frac{37}{52}$$


-------------------------------------------------------------------

| $\spadesuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\heartsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\diamondsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

| $\clubsuit$ | A | K | Q | J | T | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 |

-------------------------------------------------------------------


The situation in Example 3 is known as the principle of inclusion-exclusion, and the explicit formula will be developed in the next section.

## Principle of Inclusion-Exclusion

In general, probability of the union of two event sets $A$ and $B$ in probability space $S$ is given by:

$$P(A\cup B)=P(A)+P(B)-P(A\cap B)$$

When the events are mutually exclusive, the intersection is empty, and thus: 

$$P(A\cup B)=P(A)+P(B) \hspace{5mm}\text{only if }\hspace{3mm} A\cap B =\emptyset$$

We would like to generalize the situation in equation (3) to three or more sets, for example:

$$P(H\cup E \cup F)=P(A)+P(B)+P(C)\ \pm\ ??$$


```{figure} ProbFig2a.PNG
---
height: 150px
name: 2wayset
---
Two-way set intersections (green) 
```

We need to subtract out all the overlapping area:

$$\begin{align*}
    P(H\cup E \cup F)&=P(A)+P(B)+P(C)\\&-P(A\cap B)-P(A\cap C)\\
    &- P(B\cap C) \ \pm\ ??    
\end{align*}$$

Yet the 2-way intersections all overlap in the single 3-way intersection region (purple) which has now been removed three times. Think about the first three terms - the purple region gets added three times. It's triple counted. But when we substract each 2-way intersection, we remove the purple region three times, so it's no longer being counted at all. We must add it back in. This should provide motivation for the following formula.

````{figure} ../ProbFig2b.PNG
---
height: 150px
name: 3wayset
---
Three-way set intersection (purple)
````
### Inclusion-Exclusion Formula for Three Sets.

Given event sets $A$, $B$ and $C$ in probability space $S$, the probability of the union of $A,B,C$ is given by:

$$P(A\cup B\cup C)=P(A)+P(B)+P(C)-P(A\cap B)-P(A\cap C)-P(B\cap C)+P(A\cap
B\cap C)$$

Returning to example 3, the figure and formula are color-coded for clarity:

$$\begin{align*}
    P(H\cup E\cup C)&=P(H)+P(E)+P(F)\\
    &-P(H\cap E)-P(H\cap F)-P(E\cap F)\\
    &+P(H\cap E\cap F)\\
    &=\frac{1}{4}+\frac{1}{2}+\frac{3}{13}-\frac{6}{52}-\frac{3}{52}-\frac{4}{52}+\frac{1}{52}}\\
    &=\frac{13+26+12-6-3-4+1}{52}\\
    &=\frac{51-13}+1}{52}\\
    &=\frac{37}{52}
\end{align*}$$ 

and the sets used are given explicitly:

* $H\cap E=\{2 \heartsuit,4 \heartsuit,6\heartsuit,8 \heartsuit, T \heartsuit, Q \heartsuit\} \hspace{5mm} \implies \hspace{5mm} |H\cap E|=6$
* $H\cap F=\{ J \heartsuit, Q \heartsuit, K \heartsuit \}  \hspace{25mm} \implies \hspace{5mm} |H\cap F|=3$
* $E\cap F=\{ Q\spadesuit,Q \heartsuit,Q\clubsuit,Q\diamondsuit, \} \hspace{15.25mm} \implies \hspace{5mm} |E\cap F|=4$
* $H\cap E\cap F=\{Q \heartsuit \}\hspace{34mm} \implies \hspace{5mm}|H\cap E\cap F|=1$ 

## Quick Note about AND and OR

As a high school math teacher, I once wrote on the board that "OR means add; AND means multiply." False. Not true. Incorrect mathematics on my whiteboard. Why did I do it? I was coaching students who were preparing for the Ohio math graduation test, and it was a viable keyword approach. Given the previous five years of test questions, a kid could get the right answer more than 90\% of the time by using the operation indicated by the keyword. Just multiply probabilities if asked about events $A$ **and** $B$ happening. Add probabilities if  asked about events $A$ **or** $B$ happening. My incorrect mathematics was helpful to students on that particular test.

I take a very different approach these days. Mathematics teachers should never say or write anything that is mathematically false. Do we slip up? Sure, but the goal ought to be perfect mathematical precision.

For probability, **or** does typically indicate addition. For sets, saying "either $A$ or $B$" means that we are combining the elements from both sets, e.g. addition. The problem comes with the **and** keyword which can be translated into set operations in two very different ways:

* If event sets $A$ and $B$ are both subsets of the same probability space $S$, then multiplying $P(A)\cdot P(B)$ is almost always wrong.
* If event sets $A$ and $B$ are subsets of different probability spaces, say $S$ and $T$ respectively, then they are *independent* and $P(A\text{ and } B)=P(A)\cdot P(B)$.

We will address this question in depth once we know more about counting and about conditional probability. For now, let's look at a couple of easy examples.

````{admonition} Example
:class: note
A card is drawn at random. What is the probability it's both a club ($\clubsuit$) and a jack?
````

**Solution.** Using the obvious symbols for the two event sets, we have:

$$P(C\cap J)=\frac{1}{52}$$

because there is only one 4 of $\clubsuit$'s in the deck. Note that $P(C)=\frac{1}{4}$ and $P(J)=\frac{1}{13}$, so it is true that

$$P(C\cap J)=P(C)\cdot P(J)=\frac{1}{4}\cdot\frac{1}{13}=\frac{1}{52}$$

----

In the above example, the sets are \emph{independent}. Having the card turn out to be a jack did not affect whether or not it was a club. Contrast Example 4 with drawing a card that is both a face card and even:

$$P(F\cap E)=\frac{4}{52}=\frac{1}{13}$$ 

because only the queens are even. Jacks and Kings are odd. But if we multiply the probabilities, we get:

$$P(F)\cdot P(E)=\frac{3}{13}\cdot \frac{1}{2}=\frac{3}{26}\neq \frac{1}{13}$$

The probabilities of events $F$ and $E$ are called \emph{dependent} in this case. The definition of independent requires conditional probability, so let's leave the discussion here for now.

## Exercises

### Practice Problems
1. Find the probability of rolling a fair 6-sided die and getting an even number.
2. Seventeen marbles are in a jar. Seven are purple, four are green and the rest orange. What is the probability of picking one at random and not getting a green marble?
3. Picking one card at random from a standard deck of playing cards, what is the probability the card is not a face card but is black?
4. Picking one card at random from a standard deck of playing cards, what is the probability the card is a heart and is even but is not an Ace?

### Solutions to Practice Problems
1. Half the numbers in the event set $\{1,2,3,4,5,6\}$ are even.
2. Let event set $G$ represent drawing a green marble, and use set complements.

$$P(\bar G)=1-P(G)=1-\frac{4}{17}=\frac{13}{17}$$

3. Using events sets $F$ and $B$ for face cards and black respectively, we use intersections and set complements. In every suit, there are 3 face cards and 10 non-face cards.

$$P(\bar F \cap B)=\frac{20}{52}$$

4. Using event sets $H$, $E$ and $A$, note that $E\cap A=\emptyset$, so that $E\cap \bar A=E$.

$$P(H\cap E \cap \bar A)=\frac{6}{52}=\frac{3}{26}$$