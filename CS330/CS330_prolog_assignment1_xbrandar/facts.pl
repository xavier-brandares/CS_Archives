package(a).

package(t).
package(u).
package(v).
package(x).
package(z).

package(aa).
package(bb).
package(cc).

depends(aa,bb).
depends(aa,cc).

depends(a, t).
depends(a, u).
depends(a, v).
depends(a, x).
depends(a, z).

depends(t, u).
depends(u, v).
depends(v, x).
depends(x, z).