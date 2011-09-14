Mad Libs
========

This Ruby Quiz is to write a program that presents the user with that favorite childhood game, Mad Libs. Don’t worry if you have never played; it’s an easy game to learn. A Mad Libs is a story with several placeholders. For example:

  I had a ((an adjective)) sandwich for lunch today. It dripped all over my ((a body part)) and ((a noun)).

The reader, the only person who sees the story, will ask another person for each placeholder in turn and record the answers. In this example, they would ask for an adjective, a body part, and a noun. The reader then reads the story, with the answers in place. It might come out something like this:

  I had a smelly sandwich for lunch today. It dripped all over my big toe and bathtub.

Laughter ensues.

The script should play the role of reader, asking the user for a series of words, then replacing placeholders in the story with the user’s answers.

We’ll keep our story format very simple, using a ((...)) notation for place- holders. Here’s an example:

  Our favorite language is ((a gemstone)).

If your program is fed that template, it should ask you to enter “a gem- stone” and then display your version of the story:

  Our favorite language is Ruby.

That covers the simple cases, but in some instances we may want to reuse an answer. For that, we’ll introduce a way to name them:

  Our favorite language is ((gem:a gemstone)). We think ((gem)) is better than ((a gemstone)).

With the previous story, your program should ask for two gemstones, then substitute the one designated by ((gem:...)) at ((gem)). When there is a colon in the ((...)), the part before the colon becomes the pointer to the reusable value, and the part after the colon is the prompt for the value. That would give results like this:

  Our favorite language is Ruby. We think Ruby is better than Emerald.

You can choose any interface you like, as long as a user can interact with the end result. You can play around with a CGI-based solution at the Ruby Quiz site.  You can find the two Mad Libs files I’m using on the Ruby Quiz site as well.
