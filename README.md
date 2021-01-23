# Κατανεμημένα Συστήματα - Εργασία 1

Σε αυτή την εργασία θα γίνει εξοικείωση με τον προγραμματισμό συστημάτων σε
πλατφόρμα linux.

Μαθησιακοί στόχοι:

1. Δημιουργία λογαριασμών στο gitlab και προσθήκη στο group του μαθήματος

2. Αντιγραφή αποθετηρίου της άσκησης

3. Compile και εκτέλεση του παραδείγματος

4. Πραγματοποίηση αλλαγών στην άσκηση, και υποβολή στο gitlab

5. Έλεγχος επιτυχημένης εκτέλεσης tests στο gitlab

## 1. Δημιουργία λογαριασμού στο gitlab

1. Συνδεθείτε στη σελίδα https://netsim.cs.uowm.gr/gitlab, και δημιουργήστε
   λογαριασμό χρησιμοποιώντας το ακαδημαϊκό σας email (`@uowm.gr` ή
   `@students.kastoria.teiwm.gr`)

2. Ανοίξτε το σύνδεσμο από το email που θα λάβετε.

3. Επισκεφτείτε το σύνδεσμο του group του μαθήματος
   https://netsim.cs.uowm.gr/gitlab/dist-syst και ζητήστε πρόσβαση σε αυτό
   από το σύνδεσμο κάτω από όνομα του group

4. Όταν αποκτήσετε πρόσβαση στο group θα μπορείτε να δείτε το repository του
   μαθήματος στο σύνδεσμο https://netsim.cs.uowm.gr/gitlab/dist-syst/ask1

## 2. Αντιγραφή αποθετηρίου της άσκησης

1. Βεβαιωθείτε ότι σε σύστημα Linux, έχετε εγκατεστημένο το `git`.

   ```bash
   sudo apt install git
   ```

2. Δημιουργήστε κλειδί `ssh` (αν δεν έχετε ήδη) και προσθέστε το στο λογαριασμό
   σας από το σύνδεσμο: https://netsim.cs.uowm.gr/gitlab/profile/keys

3. Κάνουμε αντιγραφή του αποθετηρίου της άσκησης.
   Σε κάποιον κατάλογο που επιλέγετε, εκτελείτε την εντολή

   ```bash
   git clone git@netsim.cs.uowm.gr:dist-syst/ask1.git
   ```

   Θα πρέπει να έχει δημιουργηθεί υποκατάλογος με όνομα `ask1`.
   Εισερχόμαστε στον κατάλογο με `cd ask1/`

## 3. Μεταγλώττιση (compile) του προγράμματος

1. Εγκαθιστούμε τα εργαλεία που απαιτούνται για τη μεταγλώττιση της άσκησης.
   Σε debian cased σύστημα εκτελείτε την εντολή:

   ```bash
   sudo apt install build-essential libcap-dev libacl1-dev libselinux1-dev libseccomp-dev
   ```

   Αντίστοιχα σε rpm based

   ```bash
   sudo yum install gcc gcc-c++ make libcap-devel libacl-devel libselinux-devel libseccomp-devel
   ```

2. Για τη μεταγλώττιση του προγράμματος γράφουμε την εντολή

   ```bash
   make
   ```

3. Θα πρέπει να έχει δημιουργηθεί εκτελέσιμο αρχείο στον παρόντα
   κατάλογο

4. Το εκτελούμε με `./copy`

## 3. Πραγματοποίηση αλλαγών στο πρόγραμμα

1. Αλλάζουμε τον κώδικα του αρχείου `copy.c` ώστε να τυπώνει το
   email του χρήστη μας, προσθέτοντας την εντολή

   ```c
   printf("email: dvergados@uowm.gr\n");
   ```

   όπου θα το αλλάξετε με το δικό σας email account.

2. καλούμε τη `make` για να κάνουμε το compilation

3. τρέχουμε `./copy` και θα πρέπει να εμφανιστεί το όνομά μας

## 4. Δημιουργία repository απάντησης

1. Δημιουργούμε ένα νέο κενό project στο gitlab, όπου θα αποθηκευθούν οι αλλαγές,
   από το σύνδεσμο https://netsim.cs.uowm.gr/gitlab/projects/new, με private
   visibility level, κάτω από το namespace του χρήστη σας.

2. Από το αριστερό menu επιλέγουμε "Members", και στέλνουμε invite member
   το χρήστη `dvergados` με ρόλο "reporter"

3. Μέσα από το repository που θέλουμε να ανεβάσυομε από τον υπολογιστή μας,
   εκτελούμε

   ```bash
   cd existing_repo
   git remote rename origin old-origin
   git remote add origin PROJECT_PATH
   git push -u origin --all
   git push -u origin --tags
   ```

   όπου `PROJECT_PATH` είναι το URL που εμφανίζεται κάτω από το κουμπί `clone`
   στο gitlab, πχ `git@netsim.cs.uowm.gr:dvergados/ask1_vergados.git`

## 5 Αποθήκευση αλλαγών και υποβολή στο σύστημα

1. Βλέπουμε τις αλλαγές που πραγματοποιήσαμε με `git status` και με `git diff`

2. Προσθέτουμε τις αλλαγές στο staging area

   ```bash
   git add copy.c
   ```

3. Βλέπουμε ότι οι αλλαγές μας καταχωρήθηκαν στο staging area με

   ```bash
   git status
   git diff --cached
   ```

4. Κάνω `commit` τις αλλαγές με την εντολή

   ```bash
   git commit -m "Message"
   ```

   όπου "Message" είναι περιγραφικό μήνυμα που συνοψίζει τις αλλαγές που έγιναν
   στο παρόν commit.

5. Κάνουμε `push` τις αλλαγές στο server με την εντολή

   ```bash
   git push
   ```

## 6 Επιβεβαιώνουμε ότι το pipeline της εργασίας έχει περάσει

1. Από το gitlab, επιλέγουμε το project, και από το αριστερό μενού επιλέγουμε
   "CI / CD" --> "Pipelines", και βλέπουμε ότι όλα τα stages είναι πράσινα.
   
   ![](lib/pipline_passed.png)
