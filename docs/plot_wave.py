import vcdvcd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

v = vcdvcd.VCDVCD("test/tb_top.vcd")
want = ["sensor_in", "led_progress", "led_done", "buzzer", "good_cnt"]
names = {}
for n in v.signals:
    parts = n.split(".")
    if parts[0] == "tb_top" and len(parts) == 2:
        base = parts[1].split("[")[0]
        if base in want and base not in names:
            names[base] = n

def series(name):
    out = []
    for t, val in v[name].tv:
        out.append((t, int(val, 2) if set(val) <= {"0", "1"} else 0))
    return out

data = {k: series(n) for k, n in names.items()}

# window: from start to just after the first led_done pulse ends
end = None
seen = False
for t, val in data["led_done"]:
    if val == 1:
        seen = True
    elif seen and val == 0:
        end = t
        break
tmax = int(end * 1.15)

fig, axes = plt.subplots(len(want), 1, figsize=(9, 7), sharex=True)
for ax, k in zip(axes, want):
    ts = [t for t, _ in data[k]] + [tmax]
    vs = [x for _, x in data[k]] + [data[k][-1][1]]
    ax.step(ts, vs, where="post", color="black", lw=1.2)
    ax.set_ylabel(k, rotation=0, ha="right", va="center", fontsize=10)
    ax.set_xlim(0, tmax)
    ax.grid(alpha=0.3)
axes[-1].set_xlabel("simulation time (simulator time units)")
fig.tight_layout()
fig.savefig("docs/results/waveform.png", dpi=200)
print("saved docs/results/waveform.png", names)
