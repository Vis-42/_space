# Files Deleted During Cleanup

## Typst Files Deleted

### Assignment/Worksheet Files:
1. `cm2w2.typ`
2. `cma1.typ`
3. `cma2.typ`
4. `cma3.typ`
5. `cma4.typ`
6. `cma5.typ`
7. `cma6.typ`
8. `cma7.typ`
9. `cma8.typ`
10. `cmw.typ`
11. `cmw2.typ`
12. `cmw4.typ`
13. `cmw5.typ`
14. `cmw12.typ`
15. `cmw13.typ`
16. `cmw14.typ`
17. `cmw15.typ`
18. `cmw16.typ`
19. `cmw17.typ`
20. `cmw18.typ`
21. `cmw19.typ`
22. `cmw20.typ`

### Other Typst Files:
23. `drum_rolling_physics.typ`
24. `report.typ`
25. `bois.typ` (with bois.pdf)
26. `tcb.typ` (with tcb.pdf)
27. `esr.typ` (with esr.pdf)
28. `n_cm2.typ` (with n_cm2.pdf)
29. `mm2m.typ` (with mm2m.pdf)

### Markdown Files:
30. `bois.md`

## Files That Were NOT Deleted (Recovered from ../old/):
- `cmw6.typ` ✓ Recovered
- `cmw7.typ` ✓ Recovered
- `cmw8.typ` ✓ Recovered
- `cmw9.typ` ✓ Recovered
- `cmw10.typ` ✓ Recovered
- `cmw11.typ` ✓ Recovered
- `mm2a2.typ` ✓ Recovered

## Recovery Status

**Recoverable**: The files cmw6-11 and mm2a2 were found in `../old/` directory and have been copied to `at/assignments/`.

**NOT Recoverable**: All other files listed above were permanently deleted with `rm -f` command and cannot be recovered through normal means because:
1. This is a new git repository with no commit history
2. The files were deleted with `rm -f`, not moved to Trash
3. No backup exists in the current directory structure

## Recovery Options for Lost Files

If you need to recover the permanently deleted files, you can try:

1. **Time Machine** (if enabled):
   ```bash
   # Browse to the directory in Time Machine
   open /Users/parthbhargava/_space/ms/at
   # Then use Time Machine to restore
   ```

2. **iCloud backup** (if your Documents folder is synced)

3. **Any other backup system** you have configured

4. **PDF versions**: Check if you have compiled PDF versions of these files that still exist elsewhere

## Command Used for Deletion

```bash
rm -f cm2w2.typ cma*.typ cmw*.typ drum_rolling_physics.typ report.typ \
      bois.md bois.typ bois.pdf tcb.typ tcb.pdf esr.typ esr.pdf \
      n_cm2.typ n_cm2.pdf mm2m.typ mm2m.pdf
```

This command was executed during directory organization when removing what appeared to be test/filler files.
