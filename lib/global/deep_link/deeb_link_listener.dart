

// class DeepLinkListener extends StatefulWidget {
//   const DeepLinkListener({super.key, required this.child});
//
//   final Widget child;
//
//   @override
//   State<DeepLinkListener> createState() => _DeepLinkListenerState();
// }
//
// class _DeepLinkListenerState extends State<DeepLinkListener> {
//   late final AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSub;
//
//   @override
//   void initState() {
//     super.initState();
//     _appLinks = AppLinks();
//
//     _linkSub = _appLinks.uriLinkStream.listen((uri) {
//       if (!mounted) return;
//
//       final path = uri.path.isEmpty || uri.path == '/' ? '/' : uri.path;
//
//       log('Deep link path: $path');
//       debugPrint('Deep link full: ${uri.toString()}');
//
//       final knownPaths = [
//         RegExp(r'^/$'),
//         RegExp(r'^/search$'),
//         RegExp(r'^/ads/\d+$'),
//         RegExp(r'^/profile$'),
//       ];
//
//       final isMatch = knownPaths.any((p) {
//         if (p is String) return p == path;
//         if (p is RegExp) return p.hasMatch(path);
//         return false;
//       });
//
//       if (!isMatch) {
//         log('Unrecognized deep link path: $path');
//         return;
//       }
//
//       try {
//         context.go(path);
//       } catch (e) {
//         log('Error navigating to deep link: $e');
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _linkSub?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }
