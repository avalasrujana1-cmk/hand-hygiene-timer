import klayout.db as db
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ly = db.Layout()
ly.read("docs/results/top.gds")
top = ly.top_cell()
fig, ax = plt.subplots(figsize=(10, 10))
for li in ly.layer_indexes():
    for sh in top.begin_shapes_rec(li):
        b = sh.shape().bbox().transformed(sh.trans())
        ax.add_patch(plt.Rectangle((b.left, b.bottom), b.width(), b.height(),
                                   fill=False, linewidth=0.2))
ax.set_aspect("equal"); ax.autoscale()
ax.axis("off")
fig.savefig("docs/results/layout.png", dpi=200)
print("saved docs/results/layout.png")
