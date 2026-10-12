// Practice test for the SOC Fundamentals chapter of "The Pulse (SOC Blue
// Team)". Same Lesson/QuizQuestion model as every other quiz, so it
// renders through the existing LessonScreen quiz flow. Questions follow
// the order of the six lessons it covers.

import 'lesson_model.dart';

final Lesson socFundamentalsPracticeTest = Lesson(
  title: "Practice Test: SOC Fundamentals",
  estimatedMinutes: 12,
  difficulty: LessonDifficulty.beginner,
  quiz: [
    QuizQuestion(
      question: "Which combination describes what a working SOC is actually "
                "built from?",
      options: [
        "A room of large monitors, a full-time analyst team and a SIEM,"
        " since these are the visible parts of every SOC",
        "A SIEM, an EDR product and a ticketing system, since the "
        "technology does the work and people only supervise it",
        "People, process and technology, with visibility into the "
        "monitored systems underneath all three of them",
        "Skilled analysts on their own, since good people can "
        "compensate for missing playbooks and for missing tools",
      ],
      correctIndex: 2,
      explanation:
          "If any of the three is missing the others cannot make up for "
          "it, and without visibility the alert simply never fires.",
    ),
    QuizQuestion(
      question: "What is the main trade-off of using an MSSP SOC instead of "
                "building one in-house?",
      options: [
        "24x7 coverage is affordable, but context about your "
        "environment has to be built deliberately through onboarding",
        "Coverage is much cheaper in-house, but an MSSP is always "
        "slower to respond to alerts during the working week",
        "An MSSP knows the customer's systems better than the internal "
        "team, but 24x7 coverage becomes far too expensive",
        "An MSSP removes the need for any onboarding, but the logs from"
        " every client must be stored together in one place",
      ],
      correctIndex: 0,
      explanation:
          "Cost is spread across clients, but the MSSP does not "
          "automatically know which systems matter or what normal looks "
          "like, so it must be learned.",
    ),
    QuizQuestion(
      question: "In which order do the seven stages of the investigation "
                "workflow run?",
      options: [
        "Detection, Investigate, Triage, Contain, Classify, Report and "
        "Communicate, then Eradicate once the report has been sent",
        "Triage, Detection, Investigate, Classify, Eradicate, Contain, "
        "then Report and Communicate at the very end of the work",
        "Classify, Detection, Triage, Eradicate, Investigate, Contain "
        "and Report, with Communicate left to the incident manager",
        "Detection, Triage, Classify, Investigate, Contain, Eradicate, "
        "and finally Report and Communicate, in that order",
      ],
      correctIndex: 3,
      explanation:
          "The same seven-stage shape sits underneath every alert type, "
          "and classification happens early, not as an afterthought.",
    ),
    QuizQuestion(
      question: "What does dwell time mean, and why does it matter to an L1 "
                "analyst?",
      options: [
        "How long an alert waits in the queue before an analyst opens "
        "it, which is only a staffing measure for managers",
        "How long an attacker stays inside before removal; the longer "
        "it is, the more damage, so early speed matters",
        "How long a ticket stays open after the incident ends, which "
        "matters for reporting but not for the damage done",
        "How long an analyst spends on each alert, which matters "
        "because slower investigations are always judged as worse",
      ],
      correctIndex: 1,
      explanation:
          "More emails read, more systems reached and more data copied "
          "the longer the attacker remains, so every minute saved early "
          "is one they do not get.",
    ),
    QuizQuestion(
      question: "You have strong evidence of an active P1 but not the full "
                "picture. What should you do?",
      options: [
        "Keep investigating until every detail is known, because acting"
        " on incomplete information is how analysts make errors",
        "Write the initial report first, since a complete record has to"
        " exist before any action is taken on the systems",
        "Start containing now and keep investigating alongside, because"
        " containment should not wait for a complete picture",
        "Wait for the L2 analyst to take over the ticket, because "
        "containment is a decision that only senior staff can make",
      ],
      correctIndex: 2,
      explanation:
          "Waiting for total certainty is a failure mode. Once you have "
          "enough to act, you can contain and continue to investigate at "
          "the same time.",
    ),
    QuizQuestion(
      question: "A single domain admin account is confirmed compromised. How "
                "should it be classified?",
      options: [
        "P1, because business impact alone can justify it, as that one "
        "account can touch almost everything",
        "P4, because nothing has been encrypted or deleted yet and the "
        "incident has not so far caused visible harm",
        "P2, because the compromise is confirmed but only one account "
        "is involved and no data loss is known yet",
        "P3, because the scope is only one account and severity is "
        "mainly decided by how many users are affected",
      ],
      correctIndex: 0,
      explanation:
          "You do not need all three axes maxed out. One axis that "
          "clearly justifies the level, here business impact, is enough.",
    ),
    QuizQuestion(
      question: "You are torn between calling an incident P1 or P2. What does "
                "the lesson suggest?",
      options: [
        "Ask the affected user which level they think it is, since they"
        " know best how serious the problem is for them",
        "Choose the lower level, because paging senior people for a "
        "false alarm damages the trust placed in the SOC",
        "Wait one hour for more evidence before choosing, because early"
        " labels are usually changed by the end anyway",
        "Choose the higher level, since overestimating is cheap to fix "
        "and underestimating costs extra dwell time",
      ],
      correctIndex: 3,
      explanation:
          "A few extra minutes to downgrade is a small cost. Hours of "
          "unnoticed attacker time from an underestimate is a large one.",
    ),
    QuizQuestion(
      question: "Which Initial Report summary is the strongest?",
      options: [
        "A serious security event happened on a user account today. The"
        " team is on it, and the situation seems to be well in hand "
        "now.",
        "Account X showed logins from two countries eleven minutes "
        "apart; unauthorized access confirmed and contained by 14:32.",
        "Unusual account activity was seen and handled by the SOC. The "
        "matter is believed to be resolved and no further actions are "
        "planned.",
        "There may have been some suspicious sign-in activity on an "
        "account. We are still looking into it and expect to know more "
        "soon.",
      ],
      correctIndex: 1,
      explanation:
          "A good summary is specific about what is confirmed. Vague "
          "hedging is not caution, it gives the reader nothing to act on.",
    ),
    QuizQuestion(
      question: "What is the recommended habit for notes during an "
                "investigation?",
      options: [
        "Add a line after each meaningful action, including checks that"
        " found nothing, while the work is happening",
        "Keep notes in a private notebook during the work and copy only"
        " the final conclusion into the ticket afterwards",
        "Write the whole ticket at the end, when the full story is "
        "clear and a tidy account can be produced in one go",
        "Record only the actions that found something suspicious, since"
        " negative results add clutter to the ticket history",
      ],
      correctIndex: 0,
      explanation:
          "A line saying a login history was clean prevents redoing work,"
          " or stating something you never verified, later in the "
          "investigation.",
    ),
    QuizQuestion(
      question: "Which is a root cause rather than a symptom?",
      options: [
        "The user's account was disabled and the password reset, which "
        "stopped the attacker from using it any further",
        "The password was guessed by the attacker, which allowed them "
        "to sign in to the account from another country",
        "The password was reused from a breached site, and MFA was not "
        "enforced for that user's role at the time",
        "A phishing email was delivered to the employee, which led to "
        "the account being used by someone else last week",
      ],
      correctIndex: 2,
      explanation:
          "The root cause explains why the attack could succeed at all. "
          "Fix only the symptom and the same attack works next week on "
          "someone else.",
    ),
    QuizQuestion(
      question: "Which lessons-learned statement follows the blame-free "
                "approach?",
      options: [
        "The analyst failed to notice the suspicious login and should "
        "have escalated it as soon as it appeared in the queue",
        "Alerts for this login pattern do not stand out in the queue, "
        "which makes them easy to deprioritize and miss",
        "The night shift was careless with this alert, and the team "
        "should make sure that they review their habits",
        "The help desk gave out the reset link too quickly, and that "
        "mistake is what allowed the attacker to get in",
      ],
      correctIndex: 1,
      explanation:
          "Writing about systems and processes points toward a fix and "
          "keeps people honest. Assigning fault produces defensive, "
          "sanitized reports.",
    ),
    QuizQuestion(
      question: "What is the practical difference between an IOC and an IOA?",
      options: [
        "IOCs describe attacker behavior and change slowly, while IOAs "
        "are IP addresses and hashes that age very quickly",
        "IOCs are only used by external intelligence providers, while "
        "IOAs are only used by the internal SOC team",
        "IOCs and IOAs are the same thing under two names, and the "
        "choice depends only on which tool is being used",
        "IOCs are static artifacts like IPs and hashes that age fast; "
        "IOAs are behaviors that last and catch variants",
      ],
      correctIndex: 3,
      explanation:
          "Attackers rotate IPs and repack malware often, but the way an "
          "attack unfolds changes far more slowly.",
    ),
    QuizQuestion(
      question: "During an incident, what is the safest line to give customers "
                "about the cause?",
      options: [
        "We are investigating and will share confirmed details as soon "
        "as we have them, without naming a cause",
        "We cannot give any information about the incident, and we will"
        " not be contacting customers about it at all",
        "We believe the cause was a weakness in our authentication "
        "system, and we will confirm the details very soon",
        "The cause was a compromised vendor credential, which we are "
        "certain of on the basis of the early findings",
      ],
      correctIndex: 0,
      explanation:
          "Never state an unconfirmed root cause externally. If it turns "
          "out wrong you have two problems, the incident and a public "
          "correction.",
    ),
    QuizQuestion(
      question: "When should legal and compliance be brought in on an incident?",
      options: [
        "Only once you have absolute proof that personal data was "
        "exposed and the exact number of people affected",
        "Only after the incident is closed, because their involvement "
        "could slow down the technical response in progress",
        "As soon as personal or regulated data might have been "
        "accessed, because notification clocks can start earlier",
        "Only when a customer or a regulator contacts the company to "
        "ask what happened during the incident period",
      ],
      correctIndex: 2,
      explanation:
          "Notification deadlines can start counting from reasonable "
          "suspicion, not from full certainty, so waiting can mean a "
          "missed deadline.",
    ),
    QuizQuestion(
      question: "How should incident communications be handled for different "
                "audiences?",
      options: [
        "Send one detailed technical message to everyone, so that "
        "nobody can say they received less information than another",
        "Tailor each: full detail for the team, impact and timeline for"
        " customers, specific actions for end users",
        "Send detail only to customers and leave staff out, since the "
        "customers are the people who are directly affected",
        "Send the same short message to everyone, since consistency "
        "matters more than meeting each reader's needs",
      ],
      correctIndex: 1,
      explanation:
          "One message for everyone serves nobody well: it either drowns "
          "readers in detail or starves the team of what it needs.",
    ),
  ],
);
