# ... k-2 | k-1 | k | k+1 | k+2 ...

#   C Code

#   swap (int v[], int k)
#   {
#     int temp;
#     temp = v[k];
#     v[k] = v[k+1];
#     v[k+1] = temp;
#   }

# $s4 -> &v[]
# $s5 -> k

swap:
    add $t2, $s5, $s5  # $t2 = 2k
    add $t2, $t2, $t2  # $t2 = 4k
    add $t2, $s4, $t2  # $t2 = &v[k]
    lw  $t3, 0($t2)    # $t3 = v[k]
    lw  $t4, 4($t2)    # $t4 = v[k+1]
    sw  $t4, 0($t2)    # 0($t2) = $t4
    sw  $t3, 4($t2)    # 4($t2) = $t3