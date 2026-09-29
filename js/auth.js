// REPLAY CORE — gestion de session (utilisé sur toutes les pages sauf index.html)

async function requireSession() {
  const { data: { session } } = await sb.auth.getSession();
  if (!session) {
    window.location.href = "index.html";
    return null;
  }
  const { data: profile, error } = await sb
    .from("profiles")
    .select("*")
    .eq("id", session.user.id)
    .single();

  if (error || !profile) {
    await sb.auth.signOut();
    window.location.href = "index.html";
    return null;
  }
  if (profile.status === "SUSPENDU") {
    document.body.innerHTML =
      '<div class="shell"><div class="frame"><div class="msg error">COMPTE SUSPENDU. Contactez un administrateur.</div></div></div>';
    throw new Error("suspended");
  }
  return profile;
}

async function requireAdmin() {
  const profile = await requireSession();
  if (!profile) return null;
  if (profile.access_level !== "ADMIN") {
    window.location.href = "dashboard.html";
    return null;
  }
  return profile;
}

async function logout() {
  await sb.auth.signOut();
  window.location.href = "index.html";
}

function renderNav(active, profile) {
  const el = document.getElementById("nav");
  if (!el) return;
  const adminLink = profile && profile.access_level === "ADMIN"
    ? `<a href="admin.html" class="${active === 'admin' ? 'active' : ''}">ADMIN</a>` : "";
  el.innerHTML = `
    <nav class="topbar">
      <span class="brand">REPLAY // CORE</span>
      <div class="links">
        <a href="dashboard.html" class="${active === 'dashboard' ? 'active' : ''}">IMPORT</a>
        <a href="archives.html" class="${active === 'archives' ? 'active' : ''}">ARCHIVES</a>
        <a href="monitor.html" class="${active === 'monitor' ? 'active' : ''}">CORE MONITOR</a>
        ${adminLink}
        <a href="#" id="logoutLink">DÉCONNEXION</a>
      </div>
    </nav>`;
  document.getElementById("logoutLink").addEventListener("click", (e) => { e.preventDefault(); logout(); });
}
