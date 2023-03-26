import Adam.Metadata
import Std.Tactic.RCases
import Mathlib.Tactic.LeftRight
import Mathlib.Tactic.Contrapose
import Mathlib.Tactic.Use
import Mathlib.Tactic.Ring

import Adam.ToBePorted

Game "Adam"
World "Contradiction"
Level 2

Title "Suffices"

Introduction
"
*Oddeus*' Partner meldet sich.

**Partner**: Ich habe letzthin was änliches gesehen, aber irgendwie verdreht.
"

-- Die Taktik `suffices` funktioniert genau gleich wie `have`,
-- vertauscht aber die beiden Beweisblöcke:

-- ```
-- suffices h : [Aussage]
-- [Beweis des Goals (mithilfe von h)]
-- [Beweis der Aussage h]
-- ```
-- Auf Deutsch entspricht `suffices g : [Aussage]` dem Ausdruck
-- \"Es genügt zu zeigen, dass `[Aussage]` wahr ist.\"

-- Man kann `have` und `suffices` nach belieben vertauschen. Bevorzugt, wählt man es so,
-- dass der erste Beweisblock der kürzere ist. Zum Beispiel wäre bei der vorigen Aufgabe
-- `suffices` schöner gewesen:

Statement
    "Angenommen, man hat eine Implikation $A \\Rightarrow \\neg B$ und weiss, dass
    $A \\land B$ wahr ist. Zeige, dass dies zu einem Widerspruch führt."
    (A B : Prop) (h : A → ¬ B) (k₁ : A) (k₂ : B) : False := by
  Hint "**Robo**: Ich weiss was er meint! Anstatt `have` kannst du auch `suffices`
  brauchen. Das funktioniert genau gleich, aussert dass dann die beiden Goals vertauscht sind.

  **Du**: Also nach `suffices g : ¬B` muss ich dann zuerst zeigen, wie man mit `g` den Beweis
  abschliesst bevor ich `g` beweise?

  **Robo**: Genau! Verwendende `have` und `suffices` einfach nach gutdünken."
  suffices g : ¬ B
  Hint "**Robo**: Also hier beendest du den Beweis angenommen {g} sei wahr."
  contradiction
  Hint "**Robo**: Und hier beweist du das Zwischenresultat."
  apply h
  assumption

NewTactic «suffices»
DisabledTactic «have»

Conclusion "*Oddeus* nimmt den Brief, schaut ihn an und, rollt ihn zusammen.

**Oddeus**: Ich verstehe meine Schwester nie. Kommt, vielleicht könnt ihr mir helfen.

Und er führt euch durch seinen Rosengarten."