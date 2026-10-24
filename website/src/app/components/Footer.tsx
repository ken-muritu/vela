export default function Footer() {
  return (
    <footer className="border-t border-border px-6 py-10">
      <div className="mx-auto flex max-w-5xl flex-col items-center gap-6 md:flex-row md:justify-between">
        <div className="flex items-center gap-3">
          <span className="text-sm font-semibold tracking-tight">VELA</span>
          <span className="text-xs text-muted">
            Catch every thought. Push every action.
          </span>
        </div>

        <p className="text-xs text-muted/50">
          &copy; {new Date().getFullYear()} VELA &middot; Built by{" "}
          <a
            href="https://www.muritu.top"
            target="_blank"
            rel="noopener noreferrer"
            className="text-muted hover:text-foreground transition-colors"
          >
            Kennedy Muritu
          </a>
        </p>
      </div>
    </footer>
  );
}
