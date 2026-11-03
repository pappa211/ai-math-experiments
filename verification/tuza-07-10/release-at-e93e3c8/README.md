# Historical root release records

These are byte-identical root inventories and release manifest as present at
public commit `e93e3c8b5a04b561190d02dd4c6092bc0903b1bf` (TUZA-07-10 PR #7).
They describe that earlier edition and retain any internal candidate pins.
They are not checksum claims about the current README or updated tree.

To inspect the original context in a separate checkout:

```sh
git worktree add --detach ../tuza-historical e93e3c8b5a04b561190d02dd4c6092bc0903b1bf
cd ../tuza-historical
shasum -a 256 -c FILES.sha256
shasum -a 256 -c RELEASE_FILES.sha256
```

The current root inventories describe the new edition with documented
self-exclusions. Old publication/verification receipts remain historical and
have not been rewritten as newly generated results.
