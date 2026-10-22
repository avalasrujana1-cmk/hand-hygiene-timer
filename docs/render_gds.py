import klayout.lay as lay

lv = lay.LayoutView()
lv.load_layout("docs/results/top.gds", True)
lv.max_hier()
lv.zoom_fit()
lv.save_image("docs/results/layout.png", 2000, 2000)
print("saved docs/results/layout.png")
