// REPLAY CORE — effets sonores synthétisés (Web Audio API, aucun fichier externe)

const SoundFX = (() => {
  let ctx = null;
  let enabled = localStorage.getItem("rc_sound") !== "off";

  function getCtx() {
    if (!ctx) {
      try { ctx = new (window.AudioContext || window.webkitAudioContext)(); }
      catch (e) { return null; }
    }
    if (ctx.state === "suspended") ctx.resume();
    return ctx;
  }

  function tone(freq, duration, type, volume, delay) {
    if (!enabled) return;
    const c = getCtx();
    if (!c) return;
    const osc = c.createOscillator();
    const gain = c.createGain();
    osc.type = type || "square";
    osc.frequency.value = freq;
    osc.connect(gain);
    gain.connect(c.destination);
    const startAt = c.currentTime + (delay || 0);
    gain.gain.setValueAtTime(volume || 0.05, startAt);
    gain.gain.exponentialRampToValueAtTime(0.0001, startAt + duration);
    osc.start(startAt);
    osc.stop(startAt + duration);
  }

  return {
    key: () => tone(1100 + Math.random() * 300, 0.02, "square", 0.02),
    click: () => tone(700, 0.05, "square", 0.035),
    success: () => { tone(600, 0.08, "square", 0.04, 0); tone(900, 0.1, "square", 0.04, 0.09); tone(1300, 0.12, "square", 0.04, 0.18); },
    error: () => { tone(180, 0.18, "sawtooth", 0.05, 0); tone(120, 0.22, "sawtooth", 0.05, 0.1); },
    boot: () => tone(500 + Math.random() * 300, 0.05, "square", 0.03),
    isEnabled: () => enabled,
    toggle: () => {
      enabled = !enabled;
      localStorage.setItem("rc_sound", enabled ? "on" : "off");
      return enabled;
    }
  };
})();
