# Getting Started

## Docker Desktop

Installieren von
https://www.docker.com/products/docker-desktop/

## VS Code

Installieren von
https://code.visualstudio.com/

Erweiterung `Dev Containers` von Microsoft installieren.

## Dev Container in VS Code erstellen

`F1` dann `Dev Containers: New Dev Container...` 

Als Dev Container Configuration `Node.js & TypeScript` von devcontainers auswählen. 

Danach alles bestätigen bis der Dev Container erstelt wird.

## Mini-App erstellen

Quick start entsprechend https://nextjs.org/docs/app/getting-started/installation

Im Dev Container Terminal öffnen
- entweder im Menü `Terminal` > `New Terminal`
- oder `Ctrl+Shift+ö`

Im Terminal mit `pnpm create next-app@latest my-app --yes` die Skeleton App für Next.js im Verzeichnis `my-app` installieren.

Mit `cd my-app` in das Programmverzeichnnis wechseln.

Mit `pnpm dev` den Entwicklungsmodus von Next.js starten.

App in Browser unter `http://localhost:3000/` öffnen.

## Mini-App anpassen

Im Verzeichnis `my-app/app` die Datei `page.tsx` öffnen und eine kleine Änderung "im Text" vornehmen.

Also zum Beispiel 

```ts
To get started, edit the{" "}
<code className="rounded bg-black/[.06] px-1.5 py-0.5 font-mono text-[0.9em] dark:bg-white/[.08]">
   page.tsx
</code>{" "}
file.
```
durch 

```ts
I got started!
```

ersetzen.

Danach mit `File` > `Save` oder `Strg-s` speichern und die Änderung wird direkt im Browser angezeigt.


## Learning Nuggets
    
### Bis zur nächsten Vorlesung vorbereiten

- obiges Beispiel

- [Git – Erste Schritte](https://git-scm.com/book/de/v2/Erste-Schritte-Was-ist-Versionsverwaltung) bis Kapitel 2.2


### Weitere Tutorials (die im Laufe der Vorlesung relevant werden)


- [TypeScript – offizielles Handbuch](https://www.typescriptlang.org/docs/handbook/intro.html)
- [React – offizielle Einführung](https://react.dev/learn)
- [Next.js – Getting Started](https://nextjs.org/docs)
- [Prisma – Get started](https://www.prisma.io/docs)