This is a static website generated from haml files. ezpz.

- source .haml files are in `views/*.haml`
- source layout.haml file is in `views/layout/layout.haml`
- `rake compile` (default) is used to generate `./*.html` files using the layout and each haml source file
- `rake dev` launches Guard to watch for `views/*.haml` files and recompile when needed
