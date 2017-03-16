# Check to see if any changes were made to Spruce library
has_library_changes = !git.modified_files.grep(/Sources/).empty?

# warn if this PR is above 200 lines
warn("Big PR") if git.lines_of_code > 200

# check to see if the changelog has been updated
no_changelog_entry = !git.modified_files.include?("Changelog.md")
if has_library_changes && no_changelog_entry
  fail("Any changes to the Spruce library need to be documented in the Changelog")
end

# Run SwiftLint
swiftlint.lint_files
